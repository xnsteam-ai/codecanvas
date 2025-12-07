# CodeCanvas Build and Release Pipeline

## Overview

CodeCanvas uses GitHub Actions for its automated build and release pipeline, supporting Windows, macOS, and Linux platforms. The pipeline is designed to build, test, and package CodeCanvas binaries for distribution.

## GitHub Actions Workflows

### Stable Releases

1. **CodeCanvas Stable - Linux** (`stable-linux.yml`)
   - Builds and packages CodeCanvas for Linux platforms
   - Supports multiple architectures (x64, ARM64, etc.)
   - Creates AppImage, DEB, RPM, and tar.gz packages

2. **CodeCanvas Stable - macOS** (`stable-macos.yml`)
   - Builds and packages CodeCanvas for macOS
   - Supports Intel and Apple Silicon architectures
   - Creates ZIP and DMG packages

3. **CodeCanvas Stable - Windows** (`stable-windows.yml`)
   - Builds and packages CodeCanvas for Windows
   - Supports x64 and ARM64 architectures
   - Creates MSI and ZIP packages

### Insider Builds

1. **CodeCanvas Insider - Linux** (`insider-linux.yml`)
   - Builds and packages CodeCanvas Insider for Linux platforms
   - Daily builds with the latest VS Code changes

2. **CodeCanvas Insider - macOS** (`insider-macos.yml`)
   - Builds and packages CodeCanvas Insider for macOS
   - Daily builds with the latest VS Code changes

3. **CodeCanvas Insider - Windows** (`insider-windows.yml`)
   - Builds and packages CodeCanvas Insider for Windows
   - Daily builds with the latest VS Code changes

## Build Process

### Prerequisites

The build process requires the following tools and dependencies:

- Node.js (version 20.18 or higher)
- npm (comes with Node.js)
- Python 3.11
- Git
- Rustup
- jq
- GCC, G++, Make (Linux only)
- Xcode Command Line Tools (macOS only)
- WiX Toolset (Windows only)

### Environment Variables

The build process uses the following environment variables:

- `APP_NAME`: The application name ("CodeCanvas")
- `BINARY_NAME`: The binary name ("codecanvas")
- `ORG_NAME`: The organization name (your GitHub username)
- `OS_NAME`: The target operating system
- `VSCODE_QUALITY`: Build quality ("stable" or "insider")
- `RELEASE_VERSION`: The release version number

### Build Steps

1. **Clone Repository**
   ```bash
   git clone https://github.com/<YOUR_GITHUB_USERNAME>/codecanvas.git
   cd codecanvas
   ```

2. **Install Dependencies**
   ```bash
   npm install
   ```

3. **Prepare VS Code Source**
   - Clone Microsoft's VS Code repository
   - Apply CodeCanvas patches
   - Configure product settings

4. **Build Application**
   - Compile TypeScript code
   - Minify JavaScript bundles
   - Package application resources

5. **Create Packages**
   - Generate platform-specific installers
   - Create archive files (ZIP, tar.gz)
   - Sign packages (when applicable)

## Release Process

### Versioning Scheme

CodeCanvas follows semantic versioning aligned with VS Code releases:
- Major version: Aligns with major VS Code updates
- Minor version: Aligns with minor VS Code updates
- Patch version: CodeCanvas-specific fixes and improvements

### Release Triggers

1. **Scheduled Builds**
   - Insider builds run daily
   - Check for new VS Code releases
   - Build only if changes are detected

2. **Manual Triggers**
   - Repository owners can manually trigger builds
   - Force version updates
   - Generate assets for testing

3. **Pull Request Builds**
   - Validate changes in pull requests
   - Run subset of build matrix
   - Provide quick feedback

### Artifact Generation

Each successful build produces the following artifacts:

#### Linux
- **AppImage**: Portable application image
- **DEB**: Debian package for Ubuntu/Debian
- **RPM**: Red Hat package for Fedora/RHEL
- **tar.gz**: Compressed archive

#### macOS
- **ZIP**: Compressed application bundle
- **DMG**: Disk image installer

#### Windows
- **MSI**: Windows Installer package
- **ZIP**: Compressed archive

### Release Publishing

1. **GitHub Releases**
   - Artifacts uploaded to GitHub Releases
   - Release notes automatically generated
   - Tags created for version tracking

2. **Package Repositories**
   - DEB packages published to APT repository
   - RPM packages published to YUM/DNF repository
   - Snap packages published to Snapcraft
   - Chocolatey packages for Windows

3. **Update Service**
   - Version information published to update server
   - Clients can check for updates
   - Automatic update notifications

## Customization Points

### Branding Customization

All branding elements can be customized:
- Application name and identifiers
- Icons and visual assets
- Documentation and help resources
- Extension marketplace configuration

### Build Configuration

Platform-specific build options:
- Architecture targeting (x64, ARM64, etc.)
- Feature flags for experimental features
- Dependency version pinning
- Compiler optimization settings

### Release Customization

Release process can be customized:
- Package format selection
- Signing certificate configuration
- Repository publishing settings
- Notification channels

## Security Considerations

### Code Signing

- Windows binaries signed with authenticode certificates
- macOS applications signed and notarized
- Linux packages signed with GPG keys
- Signing keys securely managed in GitHub Secrets

### Dependency Verification

- npm package integrity verified with checksums
- Third-party binaries verified before use
- Regular security audits of dependencies
- Vulnerability scanning in CI pipeline

### Build Isolation

- Clean build environments for each run
- No shared state between builds
- Reproducible build process
- Artifact verification and validation

## Troubleshooting

### Common Build Issues

1. **Dependency Installation Failures**
   - Clear npm cache: `npm cache clean --force`
   - Reinstall dependencies: `rm -rf node_modules && npm install`
   - Check Node.js version compatibility

2. **Compilation Errors**
   - Verify TypeScript configuration
   - Check for missing type definitions
   - Review recent code changes

3. **Packaging Failures**
   - Validate package configuration files
   - Check platform-specific requirements
   - Review signing certificate status

### Debugging Tips

1. **Enable Verbose Logging**
   - Set `DEBUG=*` environment variable
   - Review build logs in GitHub Actions
   - Enable detailed output for specific tools

2. **Local Testing**
   - Run individual build steps locally
   - Use development build scripts
   - Test on representative hardware

3. **Cross-Platform Issues**
   - Verify platform-specific code paths
   - Check file permission settings
   - Review path separator handling

## Maintenance

### Regular Updates

1. **VS Code Synchronization**
   - Monitor upstream VS Code releases
   - Update VS Code commit references
   - Apply necessary patches

2. **Dependency Updates**
   - Regular npm dependency updates
   - Security patch integration
   - Compatibility testing

3. **Workflow Maintenance**
   - Update GitHub Actions versions
   - Review build environment changes
   - Optimize build performance

### Performance Optimization

1. **Build Caching**
   - Leverage GitHub Actions caching
   - Cache dependency installations
   - Reuse compiled artifacts when possible

2. **Parallel Processing**
   - Distribute builds across runners
   - Parallelize packaging steps
   - Optimize resource utilization

3. **Resource Management**
   - Monitor build duration and costs
   - Optimize Docker container sizes
   - Reduce unnecessary build steps

## Contributing to the Build System

### Adding New Platforms

1. Create platform-specific build scripts
2. Configure GitHub Actions workflow
3. Set up packaging and signing
4. Test installation and functionality
5. Document platform requirements

### Improving Build Performance

1. Profile build steps for bottlenecks
2. Optimize compilation and packaging
3. Implement smarter caching strategies
4. Reduce redundant operations
5. Parallelize independent tasks

### Extending Release Capabilities

1. Add support for new package formats
2. Integrate with additional repositories
3. Enhance update notification system
4. Improve release automation
5. Expand testing coverage