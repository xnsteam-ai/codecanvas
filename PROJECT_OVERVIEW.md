# CodeCanvas Project Overview

## What Was Forked

CodeCanvas is a legally clean fork of [VSCodium](https://github.com/VSCodium/vscodium), which itself is a community-driven, freely-licensed distribution of Microsoft's Visual Studio Code. 

The core differences between CodeCanvas and VSCodium are:

1. **Branding**: All references to "VSCodium" have been replaced with "CodeCanvas"
2. **Visual Identity**: New icons and color schemes have been implemented
3. **Project Identity**: CodeCanvas establishes its own identity while maintaining the same excellent functionality

## What Has Been Customized

### Branding Changes
- Application name: "VSCodium" → "CodeCanvas"
- Binary name: "codium" → "codecanvas"
- All product identifiers updated (bundle IDs, registry keys, etc.)
- New icon designs with a canvas/grid theme
- Updated documentation references

### Configuration Updates
- Maintains the same privacy-focused approach as VSCodium
- Continues to use Open VSX as the default extension marketplace
- Preserves all telemetry removal features
- Keeps the same build and packaging process

### Repository Structure
- GitHub repository: `https://github.com/<YOUR_GITHUB_USERNAME>/codecanvas`
- Maintains the same directory structure and build processes as VSCodium
- Preserves all licensing and attribution to original authors

## How to Build, Run, and Package the Editor

### Prerequisites
- Node.js (version 20.18 or higher)
- npm (comes with Node.js)
- Python 3.11
- Git
- Rustup
- jq
- GCC, G++, Make (Linux only)
- Xcode Command Line Tools (macOS only)
- WiX Toolset (Windows only)

### Building CodeCanvas

1. Clone the repository:
   ```bash
   git clone https://github.com/<YOUR_GITHUB_USERNAME>/codecanvas.git
   cd codecanvas
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

3. Build the editor:
   ```bash
   # For development build
   ./dev/build.sh
   
   # For production build with packaging
   ./dev/build.sh -p
   ```

### Platform-Specific Instructions

#### Linux
Additional dependencies:
```bash
# Ubuntu/Debian
sudo apt-get install build-essential pkg-config libx11-dev libxkbfile-dev libsecret-1-dev libkrb5-dev

# Fedora/RHEL
sudo dnf install gcc gcc-c++ make pkgconfig libX11-devel libxkbfile-devel libsecret-devel krb5-devel
```

#### macOS
```bash
# Install Xcode Command Line Tools
xcode-select --install
```

#### Windows
```powershell
# Install dependencies via Chocolatey
choco install git nodejs python3 jq 7zip wixtoolset
```

### Running the Editor

After building, you can run CodeCanvas directly:
```bash
# Linux/macOS
./VSCode-linux-x64/codecanvas

# Windows
.\VSCode-win32-x64\codecanvas.exe
```

### Packaging for Distribution

To create installers and packages:
```bash
# Build with packaging
./dev/build.sh -p

# Packages will be created in the 'dist' directory
```

## Extension Marketplace and Telemetry

### Extension Marketplace
CodeCanvas continues to use Open VSX as its default extension marketplace, just like VSCodium:
- Default URL: https://open-vsx.org/
- Compatible with most VS Code extensions
- Privacy-focused alternative to Microsoft's marketplace

### Telemetry
All telemetry has been disabled by default:
- No usage data is collected
- No crash reporting unless explicitly enabled
- All privacy settings are set to the most restrictive values

## Upstream Sync Strategy

### Pulling Changes from VSCodium
To keep CodeCanvas up to date with VSCodium improvements:

1. Add VSCodium as an upstream remote:
   ```bash
   git remote add upstream https://github.com/VSCodium/vscodium.git
   ```

2. Fetch and merge changes:
   ```bash
   git fetch upstream
   git merge upstream/master
   ```

3. Resolve any conflicts that may arise from branding changes

### Automated Sync Process
A script is provided to automate the sync process:
```bash
./scripts/sync-upstream.sh
```

This script will:
1. Fetch the latest changes from VSCodium
2. Merge them into your local branch
3. Automatically reapply CodeCanvas branding changes
4. Notify you of any conflicts that need manual resolution

## Legal Compliance

CodeCanvas maintains strict legal compliance by:
- Preserving all original MIT licenses
- Using only freely available build tools and processes
- Avoiding any Microsoft trademarks or copyrighted materials
- Providing clear attribution to all original authors
- Maintaining the same open-source philosophy as VSCodium

## Contributing

Contributions to CodeCanvas are welcome! Please:
1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

For major changes, please open an issue first to discuss what you would like to change.