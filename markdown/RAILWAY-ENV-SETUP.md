# Railway Environment Variables Setup

## ⚠️ CRITICAL: Required Environment Variables

The application is failing because these environment variables are missing in Railway.

### 1. DATABASE_URL (REQUIRED)
**Why:** Prisma needs this to connect to PostgreSQL database.

**How to set:**
1. Go to Railway dashboard → honest-flexibility project
2. Click on **PostgreSQL** service (or create one if it doesn't exist)
3. Copy the **Connection URL** from the PostgreSQL service
4. Go to **meridukaan-backend** service → **Variables** tab
5. Add new variable:
   - **Name:** `DATABASE_URL`
   - **Value:** Paste the PostgreSQL connection URL (format: `postgresql://user:password@host:port/dbname?schema=public`)

**If PostgreSQL service doesn't exist:**
1. Click **+ New** → **Database** → **Add PostgreSQL**
2. Railway will auto-create and inject `DATABASE_URL` variable

### 2. JWT_SECRET (REQUIRED)
**Why:** Authentication module needs this to sign JWT tokens.

**How to set:**
1. Go to **meridukaan-backend** service → **Variables** tab
2. Add new variable:
   - **Name:** `JWT_SECRET`
   - **Value:** Any secure random string (e.g., generate with: `openssl rand -base64 32`)

**Generate a secure secret:**
```bash
openssl rand -base64 32
```

### 3. PORT (Optional - Railway auto-sets this)
Railway automatically sets `PORT` environment variable, so you don't need to set this manually.

### 4. STORAGE_PATH (Optional)
**Default:** `./storage`
Only set this if you want a custom storage path.

## Quick Setup Steps

1. **Add PostgreSQL Database:**
   - Railway dashboard → honest-flexibility project
   - Click **+ New** → **Database** → **Add PostgreSQL**
   - Railway will auto-inject `DATABASE_URL`

2. **Set JWT_SECRET:**
   - Go to **meridukaan-backend** service
   - Click **Variables** tab
   - Add: `JWT_SECRET` = (generate secure random string)

3. **Redeploy:**
   - After setting variables, Railway will auto-redeploy
   - Or manually trigger redeploy from Deployments tab

## Verify Setup

After setting variables, check:
1. **Deploy Logs** - Should show successful Prisma connection
2. **HTTP Logs** - Should show app starting on port
3. **Health Check** - Visit: `https://meridukaan-backend-production.up.railway.app/health`

## Common Errors

- **"Application failed to respond"** → Missing `DATABASE_URL` or `JWT_SECRET`
- **"Prisma connection error"** → `DATABASE_URL` incorrect or database not accessible
- **"JWT_SECRET missing"** → Auth module fails to initialize
