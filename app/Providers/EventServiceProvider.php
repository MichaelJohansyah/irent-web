<?php

namespace App\Providers;

use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;
use App\Events\OrderCreated;
use App\Listeners\SendOrderNotification;

class EventServiceProvider extends ServiceProvider
{
    protected $listen = [
        OrderCreated::class => [
            SendOrderNotification::class,
        ],
        // ...existing code...
    ];

    public function boot()
    {
        parent::boot();
    }
}