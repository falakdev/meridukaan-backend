# Troubleshooting: Application Failed to Respond

## Environment Variables Status ✅
- ✅ DATABASE_URL: Set (postgres.railway.internal)
- ✅ JWT_SECRET: Set
- ✅ STORAGE_PATH: Set

## Possible Issues & Solutions

### Issue 1: Prisma Migration Failing
**Symptom:** App crashes during `npx prisma migrate deploy`

**Check:**
1. Railway → Deployments → Latest → Deploy Logs
2. Look for: "Error applying migration" or "Migration failed"

**Solution:**
- Check if database is accessible
- Verify DATABASE_URL is correct
- Check if migrations table exists

### Issue 2: Prisma Connection Failing
**Symptom:** App crashes on startup when Prisma tries to connect

**Check:**
1. Railway → Deployments → Latest → Deploy Logs
2. Look for: "Can't reach database server" or "Connection refused"

**Solution:**
- Verify PostgreSQL service is running
- Check DATABASE_URL format
- Ensure database is accessible from app service

### Issue 3: Port Mismatch
**Symptom:** App starts but Railway can't connect

**Check:**
1. Railway Settings → Networking → Target Port
2. Should be: `3001` (or whatever PORT env var is)

**Solution:**
- Ensure app listens on `process.env.PORT` (Railway sets this automatically)
- Check Railway Target Port matches

### Issue 4: App Crashes After Startup
**Symptom:** Healthcheck passes but app crashes later

**Check:**
1. Railway → Deployments → Latest → HTTP Logs
2. Look for error messages

**Solution:**
- Check Deploy Logs for startup errors
- Verify all required env vars are set
- Check for missing dependencies

## Debugging Steps

### Step 1: Check Deploy Logs
1. Railway Dashboard → meridukaan-backend service
2. Click **Deployments** tab
3. Click latest deployment
4. Click **Deploy Logs** tab
5. Scroll to bottom - look for errors

### Step 2: Check HTTP Logs
1. Same deployment → **HTTP Logs** tab
2. Look for error responses or connection failures

### Step 3: Verify Database Connection
1. Railway → PostgreSQL service
2. Check if it's running
3. Verify connection string format

### Step 4: Test Health Endpoint
Try accessing: `https://meridukaan-backend-production.up.railway.app/health`

If this works, app is running but might have routing issues.

## Common Error Messages

- **"Can't reach database server"** → Database not accessible
- **"Migration failed"** → Database schema issue
- **"JWT_SECRET missing"** → Auth module fails (but you have it set)
- **"Port already in use"** → Port conflict
- **"Application failed to respond"** → App crashed or not listening

## Quick Fixes

1. **Redeploy:** Sometimes a fresh deploy fixes issues
2. **Check Database:** Ensure PostgreSQL service is running
3. **Verify Port:** Check Railway Target Port matches app PORT
4. **Check Logs:** Always check Deploy Logs first for exact error
