import { usePage } from "@inertiajs/react";
import AppSidebarLayout from "@/layouts/app/app-sidebar-layout";
import { BreadcrumbItem } from "@/types";

interface NotificationData {
    product_name: string;
    order_id: number;
}

interface Notification {
    id: number;
    type: 'order_created' | 'order_confirmed' | 'order_cancelled';
    data: NotificationData;
    read_at: string | null;
    created_at: string;
}

interface User {
    id: number;
    name: string;
    email: string;
}

interface SharedProps {
    auth: {
        user: User;
    };
}

type NotificationPageProps = {
    auth: {
        user: User;
    };
    notifications: Notification[];
    [key: string]: any;
}

export default function NotificationPage() {
    const { auth, notifications } = usePage<NotificationPageProps>().props;

    const breadcrumbs: BreadcrumbItem[] = [
        { title: 'Dashboard', href: '/dashboard' },
        { title: 'Notifications', href: '/dashboard/notification' },
    ];

    const getNotificationMessage = (notification: Notification) => {
        switch (notification.type) {
            case 'order_created':
                return `${notification.data.product_name} telah dipesan`;
            case 'order_confirmed':
                return `Pesanan ${notification.data.product_name} telah dikonfirmasi`;
            case 'order_cancelled':
                return `Pesanan ${notification.data.product_name} telah dibatalkan`;
            default:
                return 'Notifikasi baru';
        }
    };

    const formatTimeAgo = (date: string) => {
        const now = new Date();
        const past = new Date(date);
        const diff = now.getTime() - past.getTime();
        
        // Convert diff to minutes
        const minutes = Math.floor(diff / 1000 / 60);
        
        if (minutes < 1) return 'Baru saja';
        if (minutes < 60) return `${minutes} menit yang lalu`;
        
        const hours = Math.floor(minutes / 60);
        if (hours < 24) return `${hours} jam yang lalu`;
        
        const days = Math.floor(hours / 24);
        if (days < 30) return `${days} hari yang lalu`;
        
        const months = Math.floor(days / 30);
        if (months < 12) return `${months} bulan yang lalu`;
        
        return past.toLocaleDateString('id-ID');
    };

    const getNotificationIcon = (type: Notification['type']) => {
        switch (type) {
            case 'order_created':
                return (
                    <svg className="h-6 w-6 text-blue-500" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M16 11V7a4 4 0 00-8 0v4M5 9h14l1 12H4L5 9z" />
                    </svg>
                );
            case 'order_confirmed':
                return (
                    <svg className="h-6 w-6 text-green-500" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
                    </svg>
                );
            case 'order_cancelled':
                return (
                    <svg className="h-6 w-6 text-red-500" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M10 14l2-2m0 0l2-2m-2 2l-2-2m2 2l2 2m7-2a9 9 0 11-18 0 9 9 0 0118 0z" />
                    </svg>
                );
        }
    };

    return (
        <AppSidebarLayout breadcrumbs={breadcrumbs}>
            <div className="p-6">
                <div className="mb-6 flex items-center justify-between">
                    <h1 className="text-2xl font-bold">Notifikasi</h1>
                    {notifications.length > 0 && (
                        <button className="text-sm text-primary hover:underline">
                            Tandai semua sudah dibaca
                        </button>
                    )}
                </div>

                <div className="space-y-4">
                    {notifications.length === 0 ? (
                        <div className="rounded-lg border p-8 text-center text-muted-foreground">
                            Belum ada notifikasi
                        </div>
                    ) : (
                        notifications.map((notification) => (
                            <div
                                key={notification.id}
                                className={`rounded-lg border p-4 transition-colors ${
                                    !notification.read_at ? 'bg-muted/50' : ''
                                }`}
                            >
                                <div className="flex items-start gap-4">
                                    <div className="flex-shrink-0">
                                        {getNotificationIcon(notification.type)}
                                    </div>
                                    <div className="flex-grow">
                                        <p className="text-sm">
                                            {getNotificationMessage(notification)}
                                        </p>
                                        <span className="text-muted-foreground mt-1 block text-xs">
                                            {formatTimeAgo(notification.created_at)}
                                        </span>
                                    </div>
                                    {!notification.read_at && (
                                        <div className="flex-shrink-0">
                                            <div className="h-2 w-2 rounded-full bg-primary"></div>
                                        </div>
                                    )}
                                </div>
                            </div>
                        ))
                    )}
                </div>
            </div>
        </AppSidebarLayout>
    );
}