#!/bin/bash

# Script to sync CodeCanvas with upstream VSCodium changes
# This script will fetch the latest changes from VSCodium and reapply our branding

set -e

echo "Syncing CodeCanvas with upstream VSCodium..."

# Check if upstream remote exists
if ! git remote get-url upstream >/dev/null 2>&1; then
    echo "Adding upstream remote..."
    git remote add upstream https://github.com/VSCodium/vscodium.git
fi

echo "Fetching upstream changes..."
git fetch upstream

echo "Creating backup branch..."
BACKUP_BRANCH="backup-before-sync-$(date +%Y%m%d-%H%M%S)"
git checkout -b "$BACKUP_BRANCH"

echo "Switching back to master..."
git checkout master

echo "Merging upstream changes..."
git merge upstream/master

echo "Reapplying CodeCanvas branding..."
# This would typically run a script that reapplies all our branding changes
# For now, we'll just print a message
echo "TODO: Reapply CodeCanvas branding changes"

echo "Sync complete!"
echo "Please review the changes and resolve any conflicts."
echo "Backup branch created: $BACKUP_BRANCH"