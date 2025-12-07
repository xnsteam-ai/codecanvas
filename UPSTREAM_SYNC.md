# CodeCanvas Upstream Sync Strategy

## Overview

CodeCanvas is built on top of VSCodium, which itself is built on top of Microsoft's Visual Studio Code. To keep CodeCanvas up-to-date with improvements and security fixes from both upstream projects, we maintain a systematic approach to syncing with changes.

## Syncing with VSCodium

### Adding the Upstream Remote

To sync with VSCodium, first add it as an upstream remote:

```bash
git remote add upstream https://github.com/VSCodium/vscodium.git
```

### Fetching and Merging Changes

Regularly fetch and merge changes from VSCodium:

```bash
# Fetch the latest changes
git fetch upstream

# Merge changes into your local branch
git merge upstream/master
```

### Handling Conflicts

When merging upstream changes, you may encounter conflicts with CodeCanvas branding changes. The most common conflicts will be:

1. References to "VSCodium" that need to be changed to "CodeCanvas"
2. Binary names that need to remain "codecanvas" instead of "codium"
3. Repository URLs that need to point to your CodeCanvas repository
4. Organization names that need to be updated

### Automated Sync Process

We provide a script to automate the sync process:

```bash
./scripts/sync-upstream.sh
```

This script will:
1. Fetch the latest changes from VSCodium
2. Create a backup branch before merging
3. Merge upstream changes into your local branch
4. Notify you of any conflicts that need manual resolution

## Syncing with Microsoft's VS Code

VSCodium (and by extension, CodeCanvas) pulls in changes from Microsoft's VS Code repository through VSCodium's build process. This happens automatically when VSCodium updates its upstream references.

To manually check for VS Code updates:

```bash
# Check the current VS Code commit VSCodium is using
cat upstream/stable.json

# Check for newer VS Code releases
# Visit https://github.com/microsoft/vscode/releases
```

## Version Management

### Release Versions

CodeCanvas follows VSCodium's versioning scheme, which in turn follows VS Code's versioning. When syncing upstream, the version numbers should remain consistent with VSCodium unless there are CodeCanvas-specific changes that warrant a version bump.

### Patch Management

All custom patches for CodeCanvas are stored in the `patches` directory. When syncing with upstream, you may need to update these patches if the underlying code has changed.

To update patches:

```bash
# Update all patches
./dev/update_patches.sh

# Or update a specific patch
./dev/patch.sh <patch-name>.patch
```

## Best Practices for Syncing

### Regular Sync Schedule

We recommend syncing with upstream regularly (weekly or bi-weekly) to stay current with security fixes and improvements.

### Testing After Sync

After syncing with upstream, always test the build process:

```bash
# Clean the workspace
git clean -xdf

# Install dependencies
npm install

# Run a development build
./dev/build.sh

# Test the built application
./VSCode-<platform>-<arch>/codecanvas
```

### Backup Before Major Syncs

Before syncing with major upstream releases, create a backup branch:

```bash
git checkout -b backup-before-major-sync-$(date +%Y%m%d)
git checkout master
```

### Documenting Changes

Keep a changelog of significant CodeCanvas-specific changes that may affect syncing:

1. Branding changes
2. Custom patches
3. Configuration modifications
4. Build process modifications

## Conflict Resolution Guide

### Common Conflicts and Solutions

1. **Product Name Conflicts**
   - VSCodium references should become CodeCanvas references
   - Binary names should remain "codecanvas"
   - Repository URLs should point to your CodeCanvas repository

2. **Configuration Conflicts**
   - Preserve CodeCanvas's privacy-focused settings
   - Maintain CodeCanvas's extension marketplace configuration
   - Keep telemetry disabled

3. **Build Script Conflicts**
   - Preserve CodeCanvas's binary naming
   - Maintain CodeCanvas's repository references
   - Keep organization-specific settings

### Manual Resolution Process

When conflicts occur:

1. Identify the conflicting files:
   ```bash
   git status
   ```

2. Review each conflict and determine the appropriate resolution:
   - Keep upstream functionality but maintain CodeCanvas branding
   - Preserve CodeCanvas-specific configurations
   - Update references to point to CodeCanvas resources

3. After resolving conflicts, test the build:
   ```bash
   ./dev/build.sh
   ```

## Long-term Maintenance

### Monitoring Upstream

Watch the VSCodium repository for:
- New releases
- Security fixes
- Breaking changes
- New features that might benefit CodeCanvas

### Community Contributions

Encourage community contributions to both VSCodium and CodeCanvas:
- Report bugs to the appropriate project
- Contribute fixes upstream when possible
- Share CodeCanvas-specific improvements with the community

### Release Management

When creating CodeCanvas releases:
1. Ensure all upstream changes are synced
2. Test thoroughly on all platforms
3. Update version numbers appropriately
4. Create GitHub releases with binaries
5. Update documentation as needed

## Emergency Procedures

### Rolling Back Changes

If an upstream sync introduces critical issues:

1. Identify the problematic commit:
   ```bash
   git log --oneline -10
   ```

2. Revert to the last known good state:
   ```bash
   git revert <commit-hash>
   # Or for multiple commits:
   git reset --hard <good-commit-hash>
   ```

3. Test the reverted state
4. Investigate and fix the issue
5. Re-attempt the sync with fixes

### Security Issues

For security issues discovered after syncing:
1. Immediately assess the impact
2. Apply temporary workarounds if necessary
3. Coordinate with VSCodium team if the issue originates from upstream
4. Release patched versions as soon as possible
5. Communicate with users about the issue and fix