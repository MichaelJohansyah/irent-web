<?php

namespace App\Http\Controllers;

use App\Events\Message;
use Illuminate\Http\Request;
use Inertia\Inertia;

class ChatController extends Controller
{
    public function message(Request $request)
    {
        $validated = $request->validate([
            'username' => 'required|string',
            'message' => 'required|string'
        ]);

        broadcast(new Message(
            $validated['username'],
            $validated['message']
        ));

        // Return back to the previous page with a flash message
        return back()->with('success', 'Message sent');
    }

    public function index()
    {
        return Inertia::render('chat/index');
    }
}