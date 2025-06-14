import React, { useState } from 'react';
import { Head, useForm, Link } from '@inertiajs/react';
import { LoaderCircle } from 'lucide-react';
import { FormEventHandler } from 'react';

import InputError from '@/components/input-error';
import TextLink from '@/components/text-link';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import AuthLayout from '@/layouts/auth-layout';

type RegisterForm = {
    name: string;
    email: string;
    phone: string;
    address: string;
    ktp_photo: File | null;
    password: string;
    password_confirmation: string;
    role: 'customer' | 'partner';
};

export default function Register() {
    const { data, setData, post, processing, errors, reset } = useForm<RegisterForm>({
        name: '',
        email: '',
        phone: '',
        address: '',
        ktp_photo: null,
        password: '',
        password_confirmation: '',
        role: 'customer',
    });

    const [username, setUsername] = useState('');
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [phone, setPhone] = useState('');
    const [ktp, setKtp] = useState<File | null>(null);
    const [ktpError, setKtpError] = useState('');

    const handleKtpChange = (e: React.ChangeEvent<HTMLInputElement>) => {
        const file = e.target.files?.[0];
        if (file && file.size > 5 * 1024 * 1024) {
            setKtpError('File size must be less than 5 MB');
            setKtp(null);
        } else {
            setKtpError('');
            setKtp(file || null);
        }
    };

    const handleSubmit = (e: React.FormEvent) => {
        e.preventDefault();
        // No backend connection, just UI
    };

    return (
        <AuthLayout title="Create an account" description="Enter your details below to create your account">
            <Head title="Register" />
            <div style={{ minHeight: '100vh', display: 'flex', alignItems: 'center', justifyContent: 'center' }}>
                <form
                    onSubmit={handleSubmit}
                    style={{ width: 440, background: '#fff', borderRadius: 8, padding: 40, boxShadow: '0 0 0 2px #2221', display: 'flex', flexDirection: 'column', gap: 16 }}
                    encType="multipart/form-data"
                >
                    <h2 style={{ textAlign: 'center', fontWeight: 700, fontSize: 22, marginBottom: 16, color: '#000' }}>Register ke iRent</h2>
                    <label style={{ fontWeight: 600, fontSize: 14, color: '#000' }}>Username</label>
                    <input
                        type="text"
                        value={username}
                        onChange={e => setUsername(e.target.value)}
                        style={{ border: '1px solid #b5d3e7', borderRadius: 6, padding: 10, fontSize: 15, color: '#000', background: '#fff' }}
                    />
                    <label style={{ fontWeight: 600, fontSize: 14, color: '#000' }}>Email</label>
                    <input
                        type="email"
                        value={email}
                        onChange={e => setEmail(e.target.value)}
                        style={{ border: '1px solid #b5d3e7', borderRadius: 6, padding: 10, fontSize: 15, color: '#000', background: '#fff' }}
                    />
                    <label style={{ fontWeight: 600, fontSize: 14, color: '#000' }}>Password</label>
                    <input
                        type="password"
                        value={password}
                        onChange={e => setPassword(e.target.value)}
                        style={{ border: '1px solid #b5d3e7', borderRadius: 6, padding: 10, fontSize: 15, color: '#000', background: '#fff' }}
                    />
                    <label style={{ fontWeight: 600, fontSize: 14, color: '#000' }}>No. Telp</label>
                    <input
                        type="text"
                        value={phone}
                        onChange={e => setPhone(e.target.value)}
                        style={{ border: '1px solid #b5d3e7', borderRadius: 6, padding: 10, fontSize: 15, color: '#000', background: '#fff' }}
                    />
                    <label style={{ fontWeight: 600, fontSize: 14, color: '#000' }}>Insert Foto KTP</label>
                    <input
                        type="file"
                        accept="image/*"
                        onChange={handleKtpChange}
                        style={{ border: '1px solid #b5d3e7', borderRadius: 6, padding: 8, fontSize: 15, color: '#000', background: '#fff' }}
                        placeholder="(maksimal 5mb)"
                    />
                    {ktpError && <div style={{ color: 'red', fontSize: 13 }}>{ktpError}</div>}
                    <button
                        type="submit"
                        style={{ marginTop: 24, background: '#008ad6', color: '#fff', border: 'none', borderRadius: 24, padding: '12px 0', fontWeight: 600, fontSize: 16, cursor: 'pointer' }}
                    >
                        Buat Akun
                    </button>
                    <div style={{ textAlign: 'center', marginTop: 10, fontSize: 13, color: '#000' }}>
                        Sudah punya akun? Login <Link href="/login" style={{ textDecoration: 'underline', color: '#000' }}>disini</Link>
                    </div>
                </form>
            </div>
        </AuthLayout>
    );
}
