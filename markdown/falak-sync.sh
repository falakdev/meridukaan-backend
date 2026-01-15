#!/bin/bash

# Simple script for Falak to sync their fork with latest changes
# Just run: bash falak-sync.sh

echo "🔄 Syncing Falak's fork with latest Railway deployment changes..."
echo ""

# Check if we're in a git repo
if [ ! -d .git ]; then
    echo "❌ Error: Not in a git repository!"
    echo "Please run this script from inside the meridukaan-backend directory"
    exit 1
fi

# Check if origin remote exists
if ! git remote | grep -q "^origin$"; then
    echo "📝 Adding origin remote..."
    git remote add origin https://github.com/meridukaan2025-pso/meridukaan-backend.git
fi

# Check if falakdev remote exists
if ! git remote | grep -q "^falakdev$"; then
    echo "📝 Adding falakdev remote..."
    git remote add falakdev https://github.com/falakdev/meridukaan-backend.git
fi

echo "📥 Fetching latest changes from origin..."
git fetch origin

echo "📍 Current branch: $(git branch --show-current)"
echo "🔀 Switching to main branch..."
git checkout main 2>/dev/null || git checkout -b main

echo "⬇️  Pulling latest changes..."
git pull origin main

echo "⬆️  Pushing to Falak's fork..."
if git push falakdev main; then
    echo ""
    echo "✅ SUCCESS! Falak's fork is now updated!"
    echo ""
    echo "🚀 Next steps:"
    echo "1. Go to Railway dashboard"
    echo "2. Open 'honest-flexibility' project"
    echo "3. Railway will auto-deploy the changes"
else
    echo ""
    echo "❌ Push failed. Possible reasons:"
    echo "   - No write access to falakdev/meridukaan-backend"
    echo "   - Need to authenticate with GitHub"
    echo ""
    echo "💡 Alternative: Use GitHub web interface"
    echo "   1. Go to: https://github.com/falakdev/meridukaan-backend"
    echo "   2. Click 'Sync fork' or 'Fetch upstream'"
    echo "   3. Click 'Fetch and merge'"
fi
