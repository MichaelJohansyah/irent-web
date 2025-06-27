import { NavMain } from '@/components/nav-main';
import { NavUser } from '@/components/nav-user';
import { Sidebar, SidebarContent, SidebarFooter, SidebarHeader, SidebarMenu, SidebarMenuButton, SidebarMenuItem } from '@/components/ui/sidebar';
import { Link, usePage } from '@inertiajs/react';
import { Bell, FileText, LayoutGrid, ListOrdered, MessageCircle, Plus, Users } from 'lucide-react';
import AppLogo from './app-logo';

export function AppSidebar() {
    const { props } = usePage();
    const user = props.user || {};
    const userRole = user && typeof user === 'object' && 'role' in user ? user.role : undefined;
    const isCustomer = userRole === 'customer';
    const isPartner = userRole === 'partner';
    const isAdmin = userRole === 'admin';
    const partnerNavItems = [
        { title: 'Add Product', href: '/dashboard/add-product', icon: Plus },
        { title: 'Check Notification', href: '/notifications', icon: Bell },
        { title: 'Chat', href: '/chatify', icon: MessageCircle },
        { title: 'Order List', href: '/orders/partner-list', icon: ListOrdered }, // changed link
        { title: 'Send Feedback', href: '/feedback', icon: FileText },
    ];
    const adminNavItems = [
        { title: 'Manage Users', href: '/admin/users', icon: Bell },
        { title: 'Manage Order', href: '/admin/orders', icon: ListOrdered },
    ];
    const mainNavItems = [
        {
            title: 'Dashboard',
            href: '/dashboard',
            icon: LayoutGrid,
        },
        ...(isCustomer
            ? [
                  { title: 'Send Feedback', href: '/feedback', icon: FileText },
                  { title: 'Chat', href: '/chatify', icon: MessageCircle },
                  { title: 'Order List', href: '/orders', icon: ListOrdered },
                  { title: 'Notification', href: '/notifications', icon: Bell },
              ]
            : []),
        ...(isAdmin
            ? [
                  { title: 'Manage Users', href: '/admin/users', icon: Users },
                  { title: 'Manage Order', href: '/admin/orders', icon: ListOrdered },
                  { title: 'User Feedback', href: '/admin/feedback', icon: FileText },
              ]
            : []),
        ...(isPartner ? partnerNavItems : []),
    ];

    return (
        <Sidebar collapsible="icon" variant="inset">
            <SidebarHeader>
                <SidebarMenu>
                    <SidebarMenuItem>
                        <SidebarMenuButton size="lg" asChild>
                            <Link href="/dashboard" prefetch>
                                <AppLogo />
                            </Link>
                        </SidebarMenuButton>
                    </SidebarMenuItem>
                </SidebarMenu>
            </SidebarHeader>

            <SidebarContent>
                <NavMain items={mainNavItems} />
            </SidebarContent>

            <SidebarFooter>
                <NavUser />
            </SidebarFooter>
        </Sidebar>
    );
}
