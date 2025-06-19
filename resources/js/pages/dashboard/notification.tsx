import AppSidebarLayout from "@/layouts/app/app-sidebar-layout";
import { BreadcrumbItem } from "@/types";
import { Head } from '@inertiajs/react';

interface Notification {
    id: number;
    type: string;
    data: {
        message: string;
        order_id: number;
        product_id: number;
        customer_name?: string;
        status?: string;
    };
    read_at: string | null;
    created_at: string;
}

interface NotificationPageProps {
    notifications: Notification[];
}

export default function NotificationPage({ notifications = [] }: NotificationPageProps) {
    const breadcrumbs: BreadcrumbItem[] = [
        { title: 'Dashboard', href: '/dashboard' },
        { title: 'Notifications', href: '/notifications' },
    ];

    return (
        <AppSidebarLayout breadcrumbs={breadcrumbs}>
            <Head title="Notifikasi" />
            <div className="p-6">
                <div className="mb-6">
                    <h1 className="text-2xl font-bold">Notifikasi</h1>
                </div>
                {notifications.length === 0 ? (
                    <div className="rounded-lg border p-8 text-center text-muted-foreground">
                        Belum ada notifikasi
                    </div>
                ) : (
                    <div className="space-y-4">
                        {notifications.map((notif) => (
                            <div key={notif.id} className={`rounded-lg border p-4 ${!notif.read_at ? 'bg-blue-50 dark:bg-blue-900/10' : ''}`}>
                                <div className="font-medium text-foreground">{notif.data.message}</div>
                                <div className="text-xs text-muted-foreground mt-1">{new Date(notif.created_at).toLocaleString('id-ID')}</div>
                            </div>
                        ))}
                    </div>
                )}
            </div>
        </AppSidebarLayout>
    );
}