#!/bin/bash
# Auto commit and push script for idrsemi
# Safe: only pushes if there are changes

cd "$(dirname "$0")/.." || exit 1

# Check if there are any changes
if [ -z "$(git status --porcelain)" ]; then
    echo "No changes to commit"
    exit 0
fi

# Stage all changes
git add -A

# Create commit with timestamp
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
git commit -m "Auto-commit: Agent work at $TIMESTAMP" \
           -m "Changes made by Clawdbot agent session"

# Push to remote (will fail safely if no remote access)
if git push origin main; then
    echo "Successfully pushed to GitHub"
else
    echo "Push failed (may need auth setup)"
    exit 1
fi