import React, { useState } from 'react';
import { Link } from '@inertiajs/react';

export default function Login() {
    const [username, setUsername] = useState('');
    const [password, setPassword] = useState('');

    const handleSubmit = (e: React.FormEvent) => {
        e.preventDefault();
        // No backend connection, just UI
    };

    return (
        <div style={{ minHeight: '100vh', display: 'flex', alignItems: 'center', justifyContent: 'center' }}>
            <form
                onSubmit={handleSubmit}
                style={{ width: 400, background: '#fff', borderRadius: 8, padding: 40, boxShadow: '0 0 0 2px #2221', display: 'flex', flexDirection: 'column', gap: 16 }}
            >
                <h2 style={{ textAlign: 'center', fontWeight: 700, fontSize: 22, marginBottom: 16, color: '#000' }}>Login ke iRent</h2>
                <label style={{ fontWeight: 600, fontSize: 14, color: '#000' }}>Username</label>
                <input
                    type="text"
                    value={username}
                    onChange={e => setUsername(e.target.value)}
                    style={{ border: '1px solid #b5d3e7', borderRadius: 6, padding: 10, fontSize: 15, color: '#000', background: '#fff' }}
                />
                <label style={{ fontWeight: 600, fontSize: 14, marginTop: 8, color: '#000' }}>Password <span style={{ float: 'right', fontWeight: 400, fontSize: 13 }}><a href="#" style={{ color: '#000', textDecoration: 'underline' }}>Lupa?</a></span></label>
                <input
                    type="password"
                    value={password}
                    onChange={e => setPassword(e.target.value)}
                    style={{ border: '1px solid #b5d3e7', borderRadius: 6, padding: 10, fontSize: 15, color: '#000', background: '#fff' }}
                />
                <button
                    type="submit"
                    style={{ marginTop: 24, background: '#008ad6', color: '#fff', border: 'none', borderRadius: 24, padding: '12px 0', fontWeight: 600, fontSize: 16, cursor: 'pointer' }}
                >
                    Login
                </button>
                <div style={{ textAlign: 'center', marginTop: 10, fontSize: 13, color: '#000' }}>
                    Belum punya akun? register <Link href="/register" style={{ textDecoration: 'underline', color: '#000' }}>disini</Link>
                </div>
            </form>
        </div>
    );
}
