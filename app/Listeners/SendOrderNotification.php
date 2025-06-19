<?php

namespace App\Listeners;

use App\Events\OrderCreated;
use App\Models\Notification;
use App\Models\User;

class SendOrderNotification
{
    public function handle(OrderCreated $event)
    {
        $order = $event->order;
        $product = $event->product;
        $customer = User::find($order->customer_id);
        
        // Create notification for the customer
        Notification::create([
            'user_id' => $order->customer_id,
            'type' => 'order_created',
            'data' => [
                'message' => "{$product->name} telah di pesan",
                'order_id' => $order->id,
                'product_id' => $product->id,
                'status' => 'unread'
            ]
        ]);

        // Create notification for the partner
        if ($order->partner_id) {
            Notification::create([
                'user_id' => $order->partner_id,
                'type' => 'new_order',
                'data' => [
                    'message' => "{$product->name} telah dipesan oleh {$customer->name}",
                    'order_id' => $order->id,
                    'product_id' => $product->id,
                    'customer_name' => $customer->name,
                    'status' => 'unread'
                ]
            ]);
        }
    }
}
