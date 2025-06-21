import { Head, router } from '@inertiajs/react';
import { Bell, Check, Trash2 } from 'lucide-react';
import { Button } from '@/components/ui/button';
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card';
import { Badge } from '@/components/ui/badge';
import { Separator } from '@/components/ui/separator';
import AppSidebarLayout from '@/layouts/app/app-sidebar-layout';
import { useState, useEffect } from 'react';

interface Notification {
    id: number;
    type: string;
    data: any;
    read_at: string | null;
    created_at: string;
}

interface NotificationsPageProps {
    notifications: Notification[];
}

export default function NotificationsPage({ notifications }: NotificationsPageProps) {
    const [localNotifications, setLocalNotifications] = useState(notifications);
    const [csrfToken, setCsrfToken] = useState('');
    const unreadCount = localNotifications.filter(n => !n.read_at).length;

    useEffect(() => {
        // Get CSRF token on component mount
        const token = document.querySelector('meta[name="csrf-token"]')?.getAttribute('content') || '';
        setCsrfToken(token);
    }, []);

    const getNotificationIcon = (type: string) => {
        switch (type) {
            case 'order_status':
                return '📦';
            case 'payment':
                return '💳';
            case 'system':
                return '🔔';
            default:
                return '📢';
        }
    };

    const getNotificationTitle = (type: string) => {
        switch (type) {
            case 'order_status':
                return 'Order Status Update';
            case 'payment':
                return 'Payment Notification';
            case 'system':
                return 'System Notification';
            default:
                return 'Notification';
        }
    };

    const formatDate = (dateString: string) => {
        return new Date(dateString).toLocaleDateString('en-US', {
            year: 'numeric',
            month: 'short',
            day: 'numeric',
            hour: '2-digit',
            minute: '2-digit'
        });
    };

    const markAsRead = async (notificationId: number) => {
        try {
            const response = await fetch(`/notifications/${notificationId}/read`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'X-Requested-With': 'XMLHttpRequest',
                    'X-CSRF-TOKEN': csrfToken,
                },
                credentials: 'same-origin',
            });

            if (response.ok) {
                setLocalNotifications(prev => 
                    prev.map(n => 
                        n.id === notificationId 
                            ? { ...n, read_at: new Date().toISOString() }
                            : n
                    )
                );
            } else {
                console.error('Failed to mark notification as read');
            }
        } catch (error) {
            console.error('Error marking notification as read:', error);
        }
    };

    const markAllAsRead = async () => {
        try {
            const response = await fetch('/notifications/mark-all-read', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'X-Requested-With': 'XMLHttpRequest',
                    'X-CSRF-TOKEN': csrfToken,
                },
                credentials: 'same-origin',
            });

            if (response.ok) {
                setLocalNotifications(prev => 
                    prev.map(n => ({ ...n, read_at: new Date().toISOString() }))
                );
            } else {
                console.error('Failed to mark all notifications as read');
            }
        } catch (error) {
            console.error('Error marking all notifications as read:', error);
        }
    };

    const deleteNotification = async (notificationId: number) => {
        try {
            const response = await fetch(`/notifications/${notificationId}`, {
                method: 'DELETE',
                headers: {
                    'Content-Type': 'application/json',
                    'X-Requested-With': 'XMLHttpRequest',
                    'X-CSRF-TOKEN': csrfToken,
                },
                credentials: 'same-origin',
            });

            if (response.ok) {
                setLocalNotifications(prev => 
                    prev.filter(n => n.id !== notificationId)
                );
            } else {
                console.error('Failed to delete notification');
            }
        } catch (error) {
            console.error('Error deleting notification:', error);
        }
    };

    return (
        <>
            <Head title="Notifications" />
            <AppSidebarLayout
                breadcrumbs={[
                    { title: 'Dashboard', href: '/dashboard' },
                    { title: 'Notifications', href: '/notifications' }
                ]}
            >
                <div className="container mx-auto p-6 space-y-6">
                    {/* Header */}
                    <div className="flex items-center justify-between">
                        <div>
                            <h1 className="text-3xl font-bold tracking-tight">Notifications</h1>
                            <p className="text-muted-foreground">
                                Stay updated with your latest activities and updates
                            </p>
                        </div>
                        <div className="flex items-center gap-2">
                            {unreadCount > 0 && (
                                <Badge variant="destructive" className="text-sm">
                                    {unreadCount} unread
                                </Badge>
                            )}
                            {unreadCount > 0 && (
                                <Button variant="outline" size="sm" onClick={markAllAsRead}>
                                    <Check className="h-4 w-4 mr-2" />
                                    Mark all as read
                                </Button>
                            )}
                        </div>
                    </div>

                    <Separator />

                    {/* Notifications List */}
                    <div className="space-y-4">
                        {localNotifications.length === 0 ? (
                            <Card>
                                <CardContent className="flex flex-col items-center justify-center py-12">
                                    <Bell className="h-12 w-12 text-muted-foreground mb-4" />
                                    <h3 className="text-lg font-semibold mb-2">No notifications yet</h3>
                                    <p className="text-muted-foreground text-center">
                                        You're all caught up! New notifications will appear here.
                                    </p>
                                </CardContent>
                            </Card>
                        ) : (
                            localNotifications.map((notification) => (
                                <Card 
                                    key={notification.id} 
                                    className={`transition-all hover:shadow-md cursor-pointer ${
                                        !notification.read_at ? 'border-l-4 border-l-blue-500 bg-blue-50/50 dark:bg-blue-950/20' : ''
                                    }`}
                                    onClick={() => !notification.read_at && markAsRead(notification.id)}
                                >
                                    <CardHeader className="pb-3">
                                        <div className="flex items-start justify-between">
                                            <div className="flex items-start gap-3">
                                                <div className="text-2xl">
                                                    {getNotificationIcon(notification.type)}
                                                </div>
                                                <div className="flex-1">
                                                    <CardTitle className="text-base">
                                                        {getNotificationTitle(notification.type)}
                                                    </CardTitle>
                                                    <CardDescription className="mt-1">
                                                        {notification.data?.message || 'You have a new notification'}
                                                    </CardDescription>
                                                </div>
                                            </div>
                                            <div className="flex items-center gap-2">
                                                <span className="text-xs text-muted-foreground">
                                                    {formatDate(notification.created_at)}
                                                </span>
                                                <Button 
                                                    variant="ghost" 
                                                    size="sm" 
                                                    className="h-8 w-8 p-0"
                                                    onClick={(e) => {
                                                        e.stopPropagation();
                                                        deleteNotification(notification.id);
                                                    }}
                                                >
                                                    <Trash2 className="h-4 w-4" />
                                                </Button>
                                            </div>
                                        </div>
                                    </CardHeader>
                                    {notification.data?.details && (
                                        <CardContent className="pt-0">
                                            <p className="text-sm text-muted-foreground">
                                                {notification.data.details}
                                            </p>
                                        </CardContent>
                                    )}
                                </Card>
                            ))
                        )}
                    </div>
                </div>
            </AppSidebarLayout>
        </>
    );
} 