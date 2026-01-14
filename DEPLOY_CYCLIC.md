# Cyclic.sh Deployment Guide (No Credit Card Required)

## Why Cyclic?
- ✅ **No credit card required**
- ✅ Always-on apps (no sleeping)
- ✅ Free PostgreSQL included
- ✅ Full WebSocket support
- ✅ Persistent file storage
- ✅ Docker support
- ✅ Simple GitHub integration

## Step-by-Step Deployment

### Step 1: Sign Up
1. Go to [cyclic.sh](https://cyclic.sh)
2. Click "Sign Up" → Use GitHub
3. Authorize Cyclic to access your repositories

### Step 2: Create New App
1. Click "New App"
2. Select "GitHub" as source
3. Choose repository: `sabasiddique1/meri-dukaan-backend`
4. Click "Connect"

### Step 3: Configure App
Cyclic will auto-detect your Dockerfile. Configure:

**Build Settings:**
- Build Command: `npm run build`
- Start Command: `node dist/src/main.js`
- Port: `3001`

**Environment Variables:**
Add these in the Cyclic dashboard:
- `DATABASE_URL` - Will be auto-set when you add PostgreSQL
- `JWT_SECRET` - Your JWT secret key
- `STORAGE_PATH` - `/app/storage`
- `NODE_ENV` - `production`
- `PORT` - `3001`

### Step 4: Add PostgreSQL Database
1. In your app dashboard, click "Add Database"
2. Select "PostgreSQL" (free tier)
3. Database URL will be auto-set as `DATABASE_URL`

### Step 5: Deploy
1. Click "Deploy" button
2. Cyclic will:
   - Build your Docker image
   - Deploy your app
   - Provide a URL (e.g., `meri-dukaan-backend.cyclic.app`)

### Step 6: Run Migrations
After deployment, use Cyclic's console or SSH:

```bash
# In Cyclic dashboard → Console/SSH
npm run prisma:migrate:deploy
npm run prisma:seed
```

## Your App URLs
After deployment:
- **API**: `https://meri-dukaan-backend.cyclic.app`
- **Health**: `https://meri-dukaan-backend.cyclic.app/health`
- **Swagger**: `https://meri-dukaan-backend.cyclic.app/api-docs`

## Notes
- Apps are always-on (no cold starts)
- Free tier includes PostgreSQL
- No credit card required
- Auto-deploys on git push
