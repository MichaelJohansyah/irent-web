import AppSidebarLayout from "@/layouts/app/app-sidebar-layout";
import { BreadcrumbItem } from "@/types";

export default function NotificationPage() {
    const breadcrumbs: BreadcrumbItem[] = [
        { title: 'Dashboard', href: '/dashboard' },
        { title: 'Notifications', href: '/dashboard/notification' },
    ];

    return (
        <AppSidebarLayout breadcrumbs={breadcrumbs}>
            <div className="p-6">
                <div className="mb-6">
                    <h1 className="text-2xl font-bold">Notifikasi</h1>
                </div>
                
                <div className="rounded-lg border p-8 text-center text-muted-foreground">
                    Belum ada notifikasi
                </div>
            </div>
        </AppSidebarLayout>
    );
}