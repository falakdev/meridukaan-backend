# Falak - Repo Update Instructions

## Quick Sync (Easiest Method)

### Option 1: GitHub Web Interface (Recommended)
1. Go to: https://github.com/falakdev/meridukaan-backend
2. Click **"Sync fork"** or **"Fetch upstream"** button
3. Click **"Fetch and merge"** to get latest changes
4. Done! Railway will auto-deploy

### Option 2: Command Line (If you have repo cloned)
```bash
cd /path/to/meridukaan-backend
git fetch origin
git checkout main
git merge origin/main
git push falakdev main
```

### Option 3: Apply Patch File
If you have the patch file:
```bash
cd /path/to/meridukaan-backend
git checkout main
git apply /path/to/falak-update.patch
git add .
git commit -m "Update Railway deployment configuration"
git push falakdev main
```

## What Changes Are Included?
- ✅ Fixed nixpacks.toml configuration
- ✅ Added Node 20 specification
- ✅ Moved Prisma to dependencies
- ✅ Added migration deploy to start command
- ✅ Created .nvmrc file

## After Updating
Railway will automatically detect the changes and deploy. Make sure:
- DATABASE_URL is set in Railway
- JWT_SECRET is set in Railway
