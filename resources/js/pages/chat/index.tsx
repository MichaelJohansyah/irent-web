import { Chat } from '@/components/chat';
import AppLayout from '@/layouts/app-layout';
import { Head } from '@inertiajs/react';

export default function index() {
    return (
        <AppLayout>
            <Head title="Chat" />
            <div className="container py-8">
                <h1 className="text-2xl font-bold mb-4">Chat Room</h1>
                <Chat />
            </div>
        </AppLayout>
    );
}