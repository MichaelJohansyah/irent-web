<?php

namespace App\Events;

use App\Models\Order;
use App\Models\Product;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class OrderCreated
{
    use Dispatchable, SerializesModels;

    public $order;
    public $product;

    public function __construct(Order $order)
    {
        $this->order = $order;
        $this->product = Product::find($order->product_id);
    }
}
