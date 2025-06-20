import AppLayout from '@/layouts/app-layout';
import { Head, usePage } from '@inertiajs/react';

const NotificationPage = () => {
  const { props } = usePage();
  const notifications = Array.isArray(props.notifications) ? props.notifications : [];
  return (
    <AppLayout breadcrumbs={[{ title: 'Notification', href: '/notifications' }]}>
      <Head title="Notification" />
      <div className="p-4">
        <h1 className="text-2xl font-bold mb-4">Notifikasi</h1>
        {notifications.length === 0 ? (
          <p>Belum ada notifikasi.</p>
        ) : (
          <ul className="space-y-2">
            {notifications.map((notif: any) => (
              <li key={notif.id} className="bg-white/10 border border-border rounded p-3">
                <div className="font-semibold">{notif.type}</div>
                <div>{notif.data?.message}</div>
                <div className="text-xs text-gray-500">{notif.read_at ? 'Dibaca' : 'Baru'}</div>
              </li>
            ))}
          </ul>
        )}
      </div>
    </AppLayout>
  );
};

export default NotificationPage;
