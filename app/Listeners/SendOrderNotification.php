<?php

namespace App\Listeners;

use App\Events\OrderCreated;
use App\Models\Notification;
use App\Models\Product;

class SendOrderNotification
{
    public function handle(OrderCreated $event)
    {
        $order = $event->order;
        $product = Product::find($order->product_id);
        
        // Create notification for the customer
        Notification::create([
            'user_id' => $order->customer_id,
            'type' => 'order_created',
            'data' => [
                'message' => "{$product->name} telah di pesan",
                'order_id' => $order->id,
                'product_id' => $product->id
            ]
        ]);

        // Create notification for the partner (owner of the product)
        if ($order->partner_id) {
            Notification::create([
                'user_id' => $order->partner_id,
                'type' => 'new_order',
                'data' => [
                    'message' => "Pesanan baru untuk {$product->name}",
                    'order_id' => $order->id,
                    'product_id' => $product->id
                ]
            ]);
        }
    }
}
