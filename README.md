# irent-web Project - Installation & Usage Guide

## Requirements

- PHP 8.2+
- Composer
- Node.js 18+
- npm
- MySQL (or SQLite for local dev)
- (Optional) Docker

## 1. Clone the Repository

```bash
git clone <your-repo-url>
cd irent-web
```

## 2. Install Dependencies

**Backend:**

```bash
composer install
```

**Frontend:**

```bash
npm install
```

## 3. Environment Setup

- Copy `.env.example` to `.env`:
    - Windows: `copy .env.example .env`
    - Linux/Mac: `cp .env.example .env`
- Generate Laravel app key:

```bash
php artisan key:generate
```

- Edit `.env` for your DB (MySQL, SQLite, or Neon/PostgreSQL).

**Example for MySQL:**

```
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=your_db
DB_USERNAME=root
DB_PASSWORD=
```

**Example for Neon (PostgreSQL):**

```
DB_CONNECTION=pgsql
DB_HOST=ep-xxxx-xxxx.us-east-2.aws.neon.tech
DB_PORT=5432
DB_DATABASE=your_db
DB_USERNAME=your_user
DB_PASSWORD=your_password
DB_SCHEMA=public
```

- You can find your Neon connection details in the Neon dashboard (https://neon.tech/). Use the `psql` connection string and map the values as above.
- If you use SSL (recommended), add:

```
DB_SSLMODE=require
```

- (Optional) For local dev, you can still use MySQL or SQLite. See `.env.example` for templates.

## 4. Database Setup

- Create your database (phpMyAdmin, CLI, etc.)
- Run migrations:

```bash
php artisan migrate
```

## 5. Running the Project

**Backend:**

```bash
php artisan serve
```

**Frontend:**

```bash
npm run dev
```

- Open the URLs shown in the terminal (usually http://localhost:8000 and http://localhost:5173)

## 6. Docker (Optional)

- Build and run:

```bash
docker build -t irent-web .
docker run -p 8080:80 irent-web
```

## 7. Queue & Notifications

- If you use notifications/jobs, run the queue worker:

```bash
php artisan queue:listen
```

## 8. SSR (Optional)

- To build and run with SSR:

```bash
npm run build:ssr
```

## 9. Testing & Linting

- Run PHP tests:

```bash
php artisan test
```

- Lint/format frontend:

```bash
npm run lint
npm run format
```

## 10. Troubleshooting

- **DB errors:** Check `.env` and DB is running
- **Port conflicts:** Change port in `.env` or use `php artisan serve --port=8080`
- **Node/npm errors:** Ensure Node.js 18+, run `npm install` again

## 11. Contributing

- Fork, branch, PR. Run tests and lint before submitting.

## 12. Resources

- [Laravel Docs](https://laravel.com/docs)
- [React Docs](https://react.dev/)
- [Inertia.js Docs](https://inertiajs.com/)
- [Laragon Docs](https://laragon.org/docs.html)

---

Happy coding!
