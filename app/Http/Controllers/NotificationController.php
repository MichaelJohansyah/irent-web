<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Notification;
use Inertia\Inertia;

class NotificationController extends Controller
{
    public function index(Request $request)
    {
        $user = Auth::user();
        $notifications = Notification::where('user_id', $user->id)
            ->orderBy('created_at', 'desc')
            ->get();
        
        // Untuk API/JSON
        if ($request->wantsJson()) {
            return response()->json($notifications);
        }
        // Untuk Inertia/SSR
        return Inertia::render('notifications/index', [
            'notifications' => $notifications
        ]);
    }
}
