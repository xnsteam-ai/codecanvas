<div id="codecanvas-logo" align="center">
    <br />
    <img src="./icons/stable/codecanvas.svg" alt="CodeCanvas Logo" width="200"/>
    <h1>CodeCanvas</h1>
    <h3>Privacy-Focused, Open Source Code Editor</h3>
</div>

<div id="badges" align="center">

[![current release](https://img.shields.io/github/release/<YOUR_GITHUB_USERNAME>/codecanvas.svg)](https://github.com/<YOUR_GITHUB_USERNAME>/codecanvas/releases)
[![license](https://img.shields.io/github/license/<YOUR_GITHUB_USERNAME>/codecanvas.svg)](https://github.com/<YOUR_GITHUB_USERNAME>/codecanvas/blob/master/LICENSE)

[![build status (linux)](https://img.shields.io/github/actions/workflow/status/<YOUR_GITHUB_USERNAME>/codecanvas/stable-linux.yml?branch=master&label=build%28linux%29)](https://github.com/<YOUR_GITHUB_USERNAME>/codecanvas/actions/workflows/stable-linux.yml?query=branch%3Amaster)
[![build status (macos)](https://img.shields.io/github/actions/workflow/status/<YOUR_GITHUB_USERNAME>/codecanvas/stable-macos.yml?branch=master&label=build%28macOS%29)](https://github.com/<YOUR_GITHUB_USERNAME>/codecanvas/actions/workflows/stable-macos.yml?query=branch%3Amaster)
[![build status (windows)](https://img.shields.io/github/actions/workflow/status/<YOUR_GITHUB_USERNAME>/codecanvas/stable-windows.yml?branch=master&label=build%28windows%29)](https://github.com/<YOUR_GITHUB_USERNAME>/codecanvas/actions/workflows/stable-windows.yml?query=branch%3Amaster)

</div>

## 🌟 Overview

CodeCanvas is a privacy-focused, libre open-source code editor built from Microsoft's Visual Studio Code source code. It maintains full compatibility with VS Code extensions while eliminating all telemetry and tracking mechanisms.

Unlike the official VS Code, CodeCanvas prioritizes your **freedom, privacy, and security** without compromising functionality. Every build is licensed under the permissive MIT license.

## ✨ Key Features

| Feature | Description |
|---------|-------------|
| **🔒 Privacy First** | All telemetry, tracking, and data collection disabled by default |
| **🚀 Full Compatibility** | Works with most VS Code extensions via Open VSX marketplace |
| **📦 Cross-Platform** | Native support for Windows, macOS, and Linux |
| **⚡ Performance** | Optimized builds with reduced resource consumption |
| **🎨 Customizable** | Extensive theming and extension support |
| **🆓 Truly Free** | No proprietary components or licensing restrictions |

## 🚀 Quick Start

### Installation

**Windows** (via WinGet):
```powershell
winget install -e --id CodeCanvas.CodeCanvas
```

**macOS** (via Homebrew):
```bash
brew install --cask codecanvas
```

**Linux** (via Snap):
```bash
snap install codecanvas --classic
```

For other installation methods, visit our [Downloads Page](https://github.com/<YOUR_GITHUB_USERNAME>/codecanvas/releases).

### First Steps

1. Launch CodeCanvas
2. Install recommended extensions from the sidebar
3. Configure your preferred theme and settings
4. Start coding!

For a comprehensive guide, see our [Getting Started Tutorial](docs/getting-started.md).

## 📦 Installation Options

<details>
<summary><strong>Expand Installation Methods</strong></summary>

### Package Managers

**Windows Package Manager (WinGet)**
```cmd
:: Stable release
winget install -e --id CodeCanvas.CodeCanvas

:: Insider builds
winget install -e --id CodeCanvas.CodeCanvas.Insiders
```

**Chocolatey (Windows)**
```cmd
choco install codecanvas
```

**Scoop (Windows)**
```bash
scoop bucket add extras
scoop install codecanvas
```

**Homebrew (macOS)**
```bash
# Stable release
brew install --cask codecanvas

# Insider builds
brew install --cask codecanvas@insiders
```

**Snap (Linux)**
```bash
snap install codecanvas --classic
```

**Arch Linux (AUR)**
```bash
# Pre-built packages
yay -S codecanvas

# Build from source
yay -S codecanvas-git
```

**Flatpak (Linux)**
```bash
flatpak install flathub com.codecanvas.codecanvas
flatpak run com.codecanvas.codecanvas
```

### Manual Installation

Download the appropriate package for your platform from our [Releases Page](https://github.com/<YOUR_GITHUB_USERNAME>/codecanvas/releases):

- **Windows**: `.exe`, `.msi`, or portable `.zip`
- **macOS**: `.dmg` or `.zip`
- **Linux**: `.deb`, `.rpm`, `AppImage`, or `.tar.gz`

</details>

## 🛠️ Usage Examples

### Essential Keyboard Shortcuts

| Shortcut | Action |
|----------|--------|
| `Ctrl+P` / `Cmd+P` | Quick Open |
| `Ctrl+Shift+P` / `Cmd+Shift+P` | Command Palette |
| `Ctrl+,` / `Cmd+,` | User Settings |
| `Ctrl+K Ctrl+S` / `Cmd+K Cmd+S` | Keyboard Shortcuts |
| `Ctrl+\` / `Cmd+\` | Toggle Sidebar |
| `Ctrl+J` / `Cmd+J` | Toggle Panel |

### Recommended Extensions

Get started faster with these essential extensions:

1. **Python Development**: `ms-python.python`
2. **JavaScript/TypeScript**: `ms-vscode.vscode-typescript-next`
3. **Git Enhancement**: `eamodio.gitlens`
4. **Code Formatting**: `esbenp.prettier-vscode`
5. **Popular Theme**: `dracula-theme.theme-dracula`

## 🔧 Building from Source

To build CodeCanvas from source:

```bash
git clone https://github.com/<YOUR_GITHUB_USERNAME>/codecanvas.git
cd codecanvas
npm install
./dev/build.sh
```

For detailed build instructions, see our [Build Guide](docs/howto-build.md).

## 🤝 Contributing

We welcome contributions from the community! Here's how you can help:

1. **Report Issues**: Found a bug? [Open an issue](https://github.com/<YOUR_GITHUB_USERNAME>/codecanvas/issues/new)
2. **Submit Pull Requests**: Have a fix or enhancement? Submit a PR
3. **Improve Documentation**: Help make our docs better
4. **Test New Features**: Try insider builds and provide feedback

Please read our [Contributing Guidelines](CONTRIBUTING.md) before submitting changes.

### Development Setup

```bash
git clone https://github.com/<YOUR_GITHUB_USERNAME>/codecanvas.git
cd codecanvas
npm install
```

## 📚 Documentation

- [Getting Started Guide](docs/getting-started.md)
- [Extension Management](docs/extensions.md)
- [Privacy & Telemetry](docs/telemetry.md)
- [Migration from VS Code](docs/migration.md)
- [Troubleshooting](docs/troubleshooting.md)
- [Build Instructions](docs/howto-build.md)

## 🎯 Why CodeCanvas Exists

Microsoft's official Visual Studio Code releases:
- Are licensed under a [restrictive, non-FLOSS license](https://code.visualstudio.com/license)
- Include mandatory telemetry and tracking mechanisms
- Contain proprietary components

CodeCanvas addresses these concerns by:
- Building directly from Microsoft's open-source VS Code repository
- Removing all telemetry and tracking functionality
- Ensuring all components are truly open-source
- Providing builds under the permissive MIT license

As stated by a Microsoft VS Code maintainer:

> When we [Microsoft] build Visual Studio Code, we clone the vscode repository, lay down a customized product.json with Microsoft-specific functionality (telemetry, gallery, logo, etc.), and produce a build under our license.
> 
> When you clone and build from the vscode repo, none of these endpoints are configured in the default product.json. Therefore, you generate a "clean" build, without Microsoft customizations, which is by default licensed under the MIT license.

CodeCanvas automates this clean build process, making it easy for everyone to access privacy-respecting, libre software.

## 🖥️ Supported Platforms

| Platform | Architectures | Packages |
|----------|---------------|----------|
| **Windows** | x64, ARM64 | `.exe`, `.msi`, `.zip` |
| **macOS** | x64, ARM64 | `.dmg`, `.zip` |
| **Linux x64** | x64 | `.deb`, `.rpm`, `AppImage`, `snap`, `.tar.gz` |
| **Linux ARM** | ARM64, ARMHF | `.deb`, `.rpm`, `snap`, `.tar.gz` |
| **Linux Other** | RISCV64, LOONG64, PPC64LE | `.tar.gz` |

Minimum requirements: Windows 10 / Server 2012 R2 or newer, macOS 10.15 or newer, modern Linux distributions.

## 🙏 Acknowledgments

<table>
  <tr>
    <td><a href="https://github.com/jaredreich" target="_blank">@jaredreich</a></td>
    <td>Logo design</td>
  </tr>
  <tr>
    <td><a href="https://github.com/PalinuroSec" target="_blank">@PalinuroSec</a></td>
    <td>CDN and domain name</td>
  </tr>
  <tr>
    <td><a href="https://www.macstadium.com" target="_blank"><img src="https://images.prismic.io/macstadium/66fbce64-707e-41f3-b547-241908884716_MacStadium_Logo.png?w=128&q=75" width="128" height="49" alt="MacStadium logo" /></a></td>
    <td>Mac mini M1 for builds</td>
  </tr>
  <tr>
    <td><a href="https://github.com/daiyam" target="_blank">@daiyam</a></td>
    <td>macOS code signing certificate</td>
  </tr>
  <tr>
    <td><a href="https://signpath.org/" target="_blank"><img src="https://avatars.githubusercontent.com/u/34448643" height="30" alt="SignPath logo" /></a></td>
    <td>Free Windows code signing via <a href="https://signpath.io/" target="_blank">SignPath.io</a></td>
  </tr>
</table>

## 📄 License

CodeCanvas is licensed under the [MIT License](LICENSE), ensuring maximum freedom for users and developers alike.

```
MIT License

Copyright (c) <YEAR> CodeCanvas Contributors

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

---

<div align="center">

[Documentation](docs/index.md) • [Report Issues](https://github.com/<YOUR_GITHUB_USERNAME>/codecanvas/issues) • [Contributing](CONTRIBUTING.md) • [License](LICENSE)

**Built with ❤️ by the open-source community**

</div>