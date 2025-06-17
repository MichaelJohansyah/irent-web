import { useState, useEffect } from 'react';
import Pusher from 'pusher-js';
import { Button } from './ui/button';
import { Input } from './ui/input';
import { usePage, router } from '@inertiajs/react';
import { type SharedData } from '@/types';

export function Chat() {
    const { auth } = usePage<SharedData>().props;
    const [messages, setMessages] = useState<Array<{ username: string; message: string }>>([]);
    const [messageInput, setMessageInput] = useState('');
    const username = auth.user?.name || 'Anonymous';

    useEffect(() => {
        const pusher = new Pusher(import.meta.env.VITE_PUSHER_APP_KEY, {
            cluster: import.meta.env.VITE_PUSHER_APP_CLUSTER,
        });

        const channel = pusher.subscribe('chat');
        
        console.log('Subscribing to chat channel...');
        
        channel.bind('message', (data: { username: string; message: string }) => {
            console.log('Received message:', data);
            setMessages((prev) => [...prev, data]);
        });

        return () => {
            console.log('Unsubscribing from chat channel...');
            channel.unbind_all();
            channel.unsubscribe();
        };
    }, []);

    const sendMessage = () => {
        if (!messageInput.trim()) return;

        // Add message locally first
        const newMessage = {
            username,
            message: messageInput
        };
        
        setMessages(prev => [...prev, newMessage]);

        router.post('/chat/message', newMessage, {
            preserveScroll: true,
            onSuccess: () => {
                setMessageInput('');
                console.log('Message sent successfully');
            },
            onError: (errors) => {
                console.error('Failed to send message:', errors);
                // Remove the message if it failed to send
                setMessages(prev => prev.filter(msg => msg !== newMessage));
            }
        });
    };

    return (
        <div className="flex flex-col h-[600px] w-full max-w-2xl mx-auto p-4 border rounded-lg">
            <div className="flex-1 overflow-y-auto mb-4 space-y-2">
                {messages.map((msg, i) => (
                    <div 
                        key={i} 
                        className={`p-3 rounded-lg ${
                            msg.username === username 
                                ? 'bg-primary/10 ml-auto' 
                                : 'bg-muted'
                        } max-w-[80%]`}
                    >
                        <div className="font-medium text-sm text-muted-foreground mb-1">
                            {msg.username}
                        </div>
                        <div>{msg.message}</div>
                    </div>
                ))}
            </div>
            <div className="flex gap-2">
                <Input
                    value={messageInput}
                    onChange={(e) => setMessageInput(e.target.value)}
                    onKeyPress={(e) => e.key === 'Enter' && sendMessage()}
                    placeholder="Type a message..."
                    className="flex-1"
                />
                <Button onClick={sendMessage}>Send</Button>
            </div>
        </div>
    );
}