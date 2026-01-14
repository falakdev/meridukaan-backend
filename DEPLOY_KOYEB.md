# Koyeb Deployment Guide (No Credit Card Required)

## Why Koyeb?
- ✅ **No credit card required** (for free tier)
- ✅ Always-on apps
- ✅ Full WebSocket support
- ✅ Persistent storage
- ✅ Docker support
- ✅ Global edge network

## Step-by-Step Deployment

### Step 1: Sign Up
1. Go to [koyeb.com](https://koyeb.com)
2. Click "Sign Up" → Use GitHub
3. Authorize Koyeb

### Step 2: Create App
1. Click "Create App"
2. Select "GitHub" → Choose `sabasiddique1/meri-dukaan-backend`
3. Koyeb will auto-detect Dockerfile

### Step 3: Configure
**Build:**
- Dockerfile detected automatically
- Build context: Root directory

**Environment Variables:**
- `DATABASE_URL` - Your PostgreSQL connection string
- `JWT_SECRET` - Your JWT secret
- `STORAGE_PATH` - `/app/storage`
- `PORT` - `3001`
- `NODE_ENV` - `production`

**Resources (Free Tier):**
- Instance: Nano (0.5 vCPU, 0.5GB RAM)
- Region: Choose closest to you

### Step 4: Add Database
1. In Koyeb dashboard → "Databases"
2. Create PostgreSQL database (free tier available)
3. Copy connection string to `DATABASE_URL`

### Step 5: Deploy
Click "Deploy" - Koyeb will build and deploy automatically.

## Your App URLs
- **API**: `https://meri-dukaan-backend-<random>.koyeb.app`
- **Health**: `https://meri-dukaan-backend-<random>.koyeb.app/health`
- **Swagger**: `https://meri-dukaan-backend-<random>.koyeb.app/api-docs`

## Notes
- Free tier: 0.5GB RAM, always-on
- No credit card for free tier
- Auto-deploys on git push
