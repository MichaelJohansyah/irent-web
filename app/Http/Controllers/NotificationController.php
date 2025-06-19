<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Inertia\Inertia;

class NotificationController extends Controller
{
    public function index()
    {
        $user = auth()->user();
        $notifications = $user->notifications()->latest()->get();

        return Inertia::render('dashboard/notification', [
            'notifications' => $notifications
        ]);
    }

    public function markAllAsRead()
    {
        $user = auth()->user();
        $user->notifications()->whereNull('read_at')->update(['read_at' => now()]);

        return redirect()->back();
    }
}
