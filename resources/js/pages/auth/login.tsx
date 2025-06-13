import React, { useState } from 'react';
import { LoaderCircle, Eye, EyeOff } from 'lucide-react';

export default function LoginPage() {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [remember, setRemember] = useState(false);
  const [showPassword, setShowPassword] = useState(false);
  const [isLoading, setIsLoading] = useState(false);
  const [emailError, setEmailError] = useState('');
  const [passwordError, setPasswordError] = useState('');

  const handleLogin = () => {
    setEmailError('');
    setPasswordError('');
    
    let hasError = false;

    if (!email) {
      setEmailError('Email wajib diisi');
      hasError = true;
    } else if (!/\S+@\S+\.\S+/.test(email)) {
      setEmailError('Format email tidak valid');
      hasError = true;
    }

    if (!password) {
      setPasswordError('Password wajib diisi');
      hasError = true;
    } else if (password.length < 6) {
      setPasswordError('Password minimal 6 karakter');
      hasError = true;
    }

    if (hasError) return;

    setIsLoading(true);
    
    // Simulasi login
    setTimeout(() => {
      setIsLoading(false);
      alert('Login berhasil!');
    }, 2000);
  };

  return (
    <div className="min-h-screen flex items-center justify-center bg-gray-50 px-4">
      <div className="w-full max-w-md space-y-6">
        {/* Logo */}
        <div className="text-center">
          <div className="text-3xl font-bold text-gray-900 mb-2">
            iRent
          </div>
          <h2 className="text-xl font-semibold text-gray-900 mb-1">
            Login ke iRent
          </h2>
          <p className="text-sm text-gray-600">
            Masukkan email dan password Anda untuk melanjutkan
          </p>
        </div>

        {/* Form */}
        <div className="bg-white p-6 rounded-lg shadow-md border border-gray-200">
          <div className="space-y-5">
            {/* Email Field */}
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">
                Username
              </label>
              <input
                type="email"
                value={email}
                onChange={(e) => {
                  setEmail(e.target.value);
                  if (emailError) setEmailError('');
                }}
                placeholder="email@example.com"
                className={`w-full px-3 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent ${
                  emailError ? 'border-red-500' : 'border-gray-300'
                }`}
              />
              {emailError && (
                <p className="mt-1 text-sm text-red-600">{emailError}</p>
              )}
            </div>

            {/* Password Field */}
            <div>
              <div className="flex justify-between items-center mb-1">
                <label className="block text-sm font-medium text-gray-700">
                  Password
                </label>
                <button 
                  className="text-sm text-blue-600 hover:underline"
                  onClick={() => alert('Fitur lupa password')}
                >
                  Lupa?
                </button>
              </div>
              <div className="relative">
                <input
                  type={showPassword ? 'text' : 'password'}
                  value={password}
                  onChange={(e) => {
                    setPassword(e.target.value);
                    if (passwordError) setPasswordError('');
                  }}
                  placeholder="••••••••"
                  className={`w-full px-3 py-2 pr-10 border rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent ${
                    passwordError ? 'border-red-500' : 'border-gray-300'
                  }`}
                />
                <button
                  onClick={() => setShowPassword(!showPassword)}
                  className="absolute inset-y-0 right-0 pr-3 flex items-center text-gray-400 hover:text-gray-600"
                >
                  {showPassword ? (
                    <EyeOff className="h-4 w-4" />
                  ) : (
                    <Eye className="h-4 w-4" />
                  )}
                </button>
              </div>
              {passwordError && (
                <p className="mt-1 text-sm text-red-600">{passwordError}</p>
              )}
            </div>

            {/* Remember Me */}
            <div className="flex items-center">
              <input
                type="checkbox"
                checked={remember}
                onChange={(e) => setRemember(e.target.checked)}
                className="h-4 w-4 text-blue-600 focus:ring-blue-500 border-gray-300 rounded"
              />
              <label className="ml-2 block text-sm text-gray-700">
                Remember me
              </label>
            </div>

            {/* Submit Button */}
            <button
              onClick={handleLogin}
              disabled={isLoading}
              className="w-full bg-blue-600 hover:bg-blue-700 disabled:bg-blue-400 text-white font-semibold py-2 px-4 rounded-full transition-colors duration-200 flex items-center justify-center"
            >
              {isLoading && <LoaderCircle className="h-4 w-4 animate-spin mr-2" />}
              Login
            </button>
          </div>

          {/* Register Link */}
          <div className="mt-4 text-center text-sm text-gray-600">
            Belum punya akun?{' '}
            <button 
              className="text-blue-600 hover:underline font-medium"
              onClick={() => alert('Menuju halaman registrasi')}
            >
              daftar disini
            </button>
          </div>
        </div>
      </div>
    </div>
  );
}