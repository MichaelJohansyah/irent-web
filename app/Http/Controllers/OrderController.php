<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Models\Product;
use App\Models\Notification;
use App\Http\Resources\OrderResource;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;

class OrderController extends Controller
{
    public function store(Request $request)
    {
        $request->validate([
            'product_id' => 'required|exists:products,id',
            'duration' => 'required|integer|min:1',
            'start_date' => 'required|date|after_or_equal:today',
        ]);

        $product = Product::findOrFail($request->product_id);
        
        // Check if duration doesn't exceed max
        if ($request->duration > $product->max_rent_day) {
            return back()->withErrors(['duration' => 'Rent duration exceeds maximum allowed days.']);
        }

        // Calculate end date and total price
        $startDate = Carbon::parse($request->start_date);
        $endDate = $startDate->copy()->addDays($request->duration);
        // Use total_price from request if present, otherwise fallback
        $totalPrice = $request->has('total_price') ? $request->total_price : ($product->rent_price * $request->duration);

        // Create the order
        $order = Order::create([
            'customer_id' => Auth::user()->id,
            'product_id' => $request->product_id,
            'partner_id' => $product->partner_id,
            'start_date' => $startDate,
            'end_date' => $endDate,
            'duration' => $request->duration,
            'total_price' => $totalPrice,
            'status' => 'waiting',
        ]);

        // Reduce product stock
        $product->decrement('stock', 1);

        // Create notification for the partner
        Notification::create([
            'user_id' => $product->partner_id,
            'type' => 'order_status',
            'data' => [
                'message' => 'You have a new order for ' . $product->name,
                'details' => 'Order ID: ' . $order->id . '. Please confirm the order.',
                'order_id' => $order->id,
            ],
        ]);

        // Create notification for the customer
        Notification::create([
            'user_id' => $order->customer_id,
            'type' => 'order_status',
            'data' => [
                'message' => 'Your order for ' . $product->name . ' has been placed.',
                'details' => 'Your order is now waiting for confirmation from the partner.',
                'order_id' => $order->id,
            ],
        ]);

        return redirect()->route('orders.index')->with('success', 'Order placed successfully!');
    }

    public function index(Request $request)
    {
        $user = Auth::user();
        if ($user->role === 'partner') {
            // Show orders for products owned by this partner, only if product exists
            $orders = Order::with(['product', 'customer'])
                ->where('partner_id', $user->id)
                ->whereHas('product')
                ->orderBy('created_at', 'desc')
                ->get();
            return Inertia::render('orders/history', [
                'orders' => $orders
            ]);
        } else {
            // Default: show orders for customer, only if product exists
            $orders = Order::with(['product', 'partner'])
                ->where('customer_id', $user->id)
                ->whereHas('product')
                ->orderBy('created_at', 'desc')
                ->get();
            return Inertia::render('orders/history', [
                'orders' => $orders
            ]);
        }
    }
    public function apiIndex()
    {
        $orders = \App\Models\Order::with(['product', 'customer', 'partner'])->get();
        return OrderResource::collection($orders);
    }

    // API endpoint: store order from mobile app
    public function apiStore(Request $request)
    {
        // Accept JSON and always return JSON
        $validated = $request->validate([
            'product_id' => 'required|exists:products,id',
            'customer_id' => 'required|exists:users,id',
            'partner_id' => 'required|exists:users,id',
            'start_date' => 'required|date',
            'end_date' => 'required|date|after_or_equal:start_date',
            'duration' => 'required|integer|min:1',
            'total_price' => 'required|numeric|min:0',
            'status' => 'required|string',
        ]);

        $order = Order::create($validated);
        $order->load(['product', 'customer', 'partner']);
        return response()->json([
            'success' => true,
            'order' => new OrderResource($order)
        ], 201);
    }
    public function adminIndex()
    {
        $orders = Order::with(['product', 'customer', 'partner'])->orderBy('created_at', 'desc')->get();
        return Inertia::render('admin/ManageOrders', [
            'orders' => $orders
        ]);
    }
    public function updateStatus(Request $request, Order $order)
    {
        try {
            $request->validate([
                'status' => 'required|in:waiting,ready,rented,return_now,finished'
            ]);
            
            // Ensure relationships are loaded
            $order->load(['product', 'customer']);
            
            $oldStatus = $order->status;
            $order->status = $request->status;
            $order->save();

            // Send notifications based on status change
            if ($oldStatus !== $request->status) {
                if ($request->status === 'return_now') {
                    // Notify customer that rental period has ended
                    Notification::create([
                        'user_id' => $order->customer_id,
                        'type' => 'order_status',
                        'data' => [
                            'message' => 'Rental period for ' . ($order->product ? $order->product->name : 'product') . ' has ended.',
                            'details' => 'Please return the item to the partner as soon as possible.',
                            'order_id' => $order->id,
                        ],
                    ]);

                    // Notify partner that rental period has ended
                    Notification::create([
                        'user_id' => $order->partner_id,
                        'type' => 'order_status',
                        'data' => [
                            'message' => 'Rental period for ' . ($order->product ? $order->product->name : 'product') . ' has ended.',
                            'details' => 'Customer: ' . ($order->customer ? $order->customer->name : 'customer') . ' should return the item soon.',
                            'order_id' => $order->id,
                        ],
                    ]);
                } elseif ($request->status === 'finished') {
                    // Notify customer about completion
                    Notification::create([
                        'user_id' => $order->customer_id,
                        'type' => 'order_status',
                        'data' => [
                            'message' => 'Your rental for ' . ($order->product ? $order->product->name : 'product') . ' has been completed.',
                            'details' => 'Thank you for using our service!',
                            'order_id' => $order->id,
                        ],
                    ]);

                    // Notify partner about completion
                    Notification::create([
                        'user_id' => $order->partner_id,
                        'type' => 'order_status',
                        'data' => [
                            'message' => 'Order for ' . ($order->product ? $order->product->name : 'product') . ' has been completed.',
                            'details' => 'Customer: ' . ($order->customer ? $order->customer->name : 'customer') . ' - order is now finished.',
                            'order_id' => $order->id,
                        ],
                    ]);
                } elseif ($request->status === 'canceled') {
                    // Notify customer about cancellation
                    Notification::create([
                        'user_id' => $order->customer_id,
                        'type' => 'order_status',
                        'data' => [
                            'message' => 'Your order for ' . ($order->product ? $order->product->name : 'product') . ' has been canceled.',
                            'details' => 'Please contact support if you have any questions.',
                            'order_id' => $order->id,
                        ],
                    ]);

                    // Notify partner about cancellation
                    Notification::create([
                        'user_id' => $order->partner_id,
                        'type' => 'order_status',
                        'data' => [
                            'message' => 'Order for ' . ($order->product ? $order->product->name : 'product') . ' has been canceled.',
                            'details' => 'Customer: ' . ($order->customer ? $order->customer->name : 'customer') . ' - order is now canceled.',
                            'order_id' => $order->id,
                        ],
                    ]);
                }
            }

            return redirect()->back()->with('success', 'Order status updated.');
            
        } catch (\Exception $e) {
            Log::error('Update status error: ' . $e->getMessage());
            return redirect()->back()->with('error', 'Failed to update order status.');
        }
    }
    public function partnerConfirm(Request $request, Order $order)
    {
        try {
            $request->validate([
                'pickup_address' => 'required|string',
                'contact_number' => 'required|string',
                'pickup_time' => 'required|string',
                'notes' => 'nullable|string',
                'return_information' => 'nullable|string',
            ]);

            // Ensure relationships are loaded
            $order->load(['product', 'customer']);

            $order->pickup_address = $request->pickup_address;
            $order->contact_number = $request->contact_number;
            $order->pickup_time = $request->pickup_time;
            $order->notes = $request->notes;
            if ($request->has('return_information')) {
                $order->return_information = $request->return_information;
            }
            
            // Only set status to 'ready' if requested and only from 'waiting'
            if ($request->has('status') && $request->status === 'ready' && $order->status === 'waiting') {
                $order->status = 'ready';

                // Notify customer that the order is confirmed
                Notification::create([
                    'user_id' => $order->customer_id,
                    'type' => 'order_status',
                    'data' => [
                        'message' => 'Your order for ' . ($order->product ? $order->product->name : 'product') . ' has been confirmed.',
                        'details' => 'The item is now ready for pickup. Please contact the partner.',
                        'order_id' => $order->id,
                    ],
                ]);

                // Notify partner about their confirmation action
                Notification::create([
                    'user_id' => $order->partner_id,
                    'type' => 'order_status',
                    'data' => [
                        'message' => 'You confirmed order for ' . ($order->product ? $order->product->name : 'product') . '.',
                        'details' => 'Order is now ready for customer pickup. Customer: ' . ($order->customer ? $order->customer->name : 'customer'),
                        'order_id' => $order->id,
                    ],
                ]);
            } else {
                // If just updating information without status change, notify customer
                Notification::create([
                    'user_id' => $order->customer_id,
                    'type' => 'order_status',
                    'data' => [
                        'message' => 'Pickup information for ' . ($order->product ? $order->product->name : 'product') . ' has been updated.',
                        'details' => 'The partner has updated the pickup details for your order.',
                        'order_id' => $order->id,
                    ],
                ]);

                // Notify partner about their update action
                Notification::create([
                    'user_id' => $order->partner_id,
                    'type' => 'order_status',
                    'data' => [
                        'message' => 'You updated pickup information for ' . ($order->product ? $order->product->name : 'product') . '.',
                        'details' => 'Pickup details have been successfully updated for customer: ' . ($order->customer ? $order->customer->name : 'customer'),
                        'order_id' => $order->id,
                    ],
                ]);
            }
            
            $order->save();
            return response()->json(['success' => true]);
            
        } catch (\Exception $e) {
            Log::error('Partner confirm error: ' . $e->getMessage());
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }

    public function partnerCancel(Request $request, Order $order)
    {
        try {
            // Ensure relationships are loaded
            $order->load(['product', 'customer']);
            
            $order->status = 'canceled';
            $order->save();

            // Notify customer that the order was canceled
            Notification::create([
                'user_id' => $order->customer_id,
                'type' => 'order_status',
                'data' => [
                    'message' => 'Your order for ' . ($order->product ? $order->product->name : 'product') . ' has been canceled.',
                    'details' => 'The partner has canceled this order. Please contact them for more information.',
                    'order_id' => $order->id,
                ],
            ]);

            // Notify partner about their cancellation action
            Notification::create([
                'user_id' => $order->partner_id,
                'type' => 'order_status',
                'data' => [
                    'message' => 'You canceled order for ' . ($order->product ? $order->product->name : 'product') . '.',
                    'details' => 'Order has been canceled. Customer: ' . ($order->customer ? $order->customer->name : 'customer'),
                    'order_id' => $order->id,
                ],
            ]);

            return response()->json(['success' => true]);
            
        } catch (\Exception $e) {
            Log::error('Partner cancel error: ' . $e->getMessage());
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }
    public function partnerOrderList(Request $request)
    {
        $user = $request->user();
        $orders = \App\Models\Order::with(['product', 'customer'])
            ->where('partner_id', $user->id)
            ->orderBy('created_at', 'desc')
            ->get();
        return \Inertia\Inertia::render('orders/partner-list', [
            'orders' => $orders
        ]);
    }

    // Partner marks order as picked up (status: rented)
    public function partnerPickedUp(Request $request, Order $order)
    {
        try {
            // Allow any status to be changed to 'rented' by partner
            $order->load(['product', 'customer']);
            if (!$order->product || !$order->customer) {
                return response()->json(['success' => false, 'message' => 'Order product or customer not found.'], 400);
            }
            $order->status = 'rented';
            $order->save();
            try {
                $productName = $order->product ? $order->product->name : 'product';
                $customerName = $order->customer ? $order->customer->name : 'customer';
                $endDate = $order->end_date ? (\Carbon\Carbon::parse($order->end_date)->format('d M Y')) : '';
                // Notify customer that the rental has started
                Notification::create([
                    'user_id' => $order->customer_id,
                    'type' => 'order_status',
                    'data' => [
                        'message' => 'Your rental for ' . $productName . ' has started.',
                        'details' => $endDate ? ('The rental period will end on ' . $endDate) : 'The rental period has started.',
                        'order_id' => $order->id,
                    ],
                ]);
                // Notify partner about rental status change
                Notification::create([
                    'user_id' => $order->partner_id,
                    'type' => 'order_status',
                    'data' => [
                        'message' => 'You marked ' . $productName . ' as picked up.',
                        'details' => 'Rental has started for customer: ' . $customerName . ($endDate ? ('. Return due: ' . $endDate) : ''),
                        'order_id' => $order->id,
                    ],
                ]);
            } catch (\Exception $e) {
                Log::error('Notification creation error (partnerPickedUp): ' . $e->getMessage());
            }
            return response()->json(['success' => true]);
        } catch (\Exception $e) {
            Log::error('Partner picked up error: ' . $e->getMessage());
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }

    // Partner finishes order (status: finished)
    public function partnerFinish(Request $request, Order $order)
    {
        try {
            // Only allow if current status is 'return_now'
            if ($order->status !== 'return_now') {
                return response()->json(['success' => false, 'message' => 'Order is not ready to be finished.'], 400);
            }
            
            // Ensure relationships are loaded
            $order->load(['product', 'customer']);
            
            if ($request->has('return_information')) {
                $order->return_information = $request->return_information;
            }
            $order->status = 'finished';
            $order->save();

            // Notify customer that the rental has finished
            Notification::create([
                'user_id' => $order->customer_id,
                'type' => 'order_status',
                'data' => [
                    'message' => 'Your rental for ' . ($order->product ? $order->product->name : 'product') . ' has finished.',
                    'details' => 'Thank you for your order!',
                    'order_id' => $order->id,
                ],
            ]);

            // Notify partner about completion
            Notification::create([
                'user_id' => $order->partner_id,
                'type' => 'order_status',
                'data' => [
                    'message' => 'You completed order for ' . ($order->product ? $order->product->name : 'product') . '.',
                    'details' => 'Order has been successfully finished. Customer: ' . ($order->customer ? $order->customer->name : 'customer'),
                    'order_id' => $order->id,
                ],
            ]);

            return response()->json(['success' => true]);
            
        } catch (\Exception $e) {
            Log::error('Partner finish error: ' . $e->getMessage());
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }
    /**
     * Set order status to 'return_now' (partner action)
     * POST /orders/{order}/partner-return-now
     */
    public function partnerReturnNow(Request $request, Order $order)
    {
        // Only allow if current user is the partner for this order
        if (Auth::id() !== $order->partner_id) {
            return response()->json(['success' => false, 'message' => 'Unauthorized'], 403);
        }
        if ($order->status !== 'rented') {
            return response()->json(['success' => false, 'message' => 'Order is not rented'], 400);
        }
        // Ensure relationships are loaded
        $order->load(['product', 'customer']);
        $order->status = 'return_now';
        $order->save();

        // Notify customer that rental period has ended
        Notification::create([
            'user_id' => $order->customer_id,
            'type' => 'order_status',
            'data' => [
                'message' => 'Rental period for ' . ($order->product ? $order->product->name : 'product') . ' has ended.',
                'details' => 'Please return the item to the partner as soon as possible.',
                'order_id' => $order->id,
            ],
        ]);

        // Notify partner that rental period has ended
        Notification::create([
            'user_id' => $order->partner_id,
            'type' => 'order_status',
            'data' => [
                'message' => 'Rental period for ' . ($order->product ? $order->product->name : 'product') . ' has ended.',
                'details' => 'Customer: ' . ($order->customer ? $order->customer->name : 'customer') . ' should return the item soon.',
                'order_id' => $order->id,
            ],
        ]);

        return response()->json(['success' => true, 'order' => $order]);
    }
}