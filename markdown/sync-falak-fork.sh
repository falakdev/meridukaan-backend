#!/bin/bash

# Script for Falak to sync their fork with the latest changes from origin
# Run this from Falak's local repository

echo "🔄 Syncing Falak's fork with latest changes..."

# Fetch latest from origin (meridukaan2025-pso)
echo "📥 Fetching latest changes from origin..."
git fetch origin

# Check current branch
CURRENT_BRANCH=$(git branch --show-current)
echo "📍 Current branch: $CURRENT_BRANCH"

# Switch to main if not already
if [ "$CURRENT_BRANCH" != "main" ]; then
    echo "🔀 Switching to main branch..."
    git checkout main
fi

# Pull latest changes from origin
echo "⬇️  Pulling latest changes from origin..."
git pull origin main

# Push to Falak's fork
echo "⬆️  Pushing to Falak's fork (falakdev remote)..."
git push falakdev main

echo "✅ Sync complete! Falak's fork is now up to date."
echo ""
echo "Next steps:"
echo "1. Go to Railway dashboard"
echo "2. Open 'honest-flexibility' project"
echo "3. Railway should auto-deploy from falakdev/meridukaan-backend"
