# CodeCanvas Extension Marketplace and Telemetry Configuration

## Extension Marketplace

CodeCanvas uses Open VSX as its default extension marketplace, maintaining the same privacy-focused approach as VSCodium.

### Default Configuration

The extension marketplace is configured in the `product.json` file with the following settings:

```json
{
  "extensionsGallery": {
    "serviceUrl": "https://open-vsx.org/vscode/gallery",
    "itemUrl": "https://open-vsx.org/vscode/item",
    "latestUrlTemplate": "https://open-vsx.org/vscode/gallery/{publisher}/{name}/latest",
    "controlUrl": "https://raw.githubusercontent.com/EclipseFdn/publish-extensions/refs/heads/master/extension-control/extensions.json"
  }
}
```

### Using a Different Extension Gallery

If you want to use a different extension gallery, you can configure it using environment variables:

- `VSCODE_GALLERY_SERVICE_URL` ***(required)***
- `VSCODE_GALLERY_ITEM_URL` ***(required)***
- `VSCODE_GALLERY_CACHE_URL`
- `VSCODE_GALLERY_CONTROL_URL`
- `VSCODE_GALLERY_EXTENSION_URL_TEMPLATE` ***(required)***
- `VSCODE_GALLERY_RESOURCE_URL_TEMPLATE`

Alternatively, you can create a custom `product.json` at the following location:

- Windows: `%APPDATA%\CodeCanvas` or `%USERPROFILE%\AppData\Roaming\CodeCanvas`
- macOS: `~/Library/Application Support/CodeCanvas`
- Linux: `$XDG_CONFIG_HOME/CodeCanvas` or `~/.config/CodeCanvas`

### Self-Hosting Your Own Extension Gallery

For enterprise users or those who want complete control over their extensions, you can self-host your own extension gallery:

1. **Open VSX** - Eclipse open-source project
   - Public instance run by the Eclipse Foundation is the pre-set endpoint
   - You can host your own instance for complete control

2. **code-marketplace** - Open-source project
   - Self-contained Go binary that reads extensions from file storage
   - Provides an API for VSCode compatible editors

## Telemetry Configuration

All telemetry is disabled by default in CodeCanvas, continuing the privacy-focused approach of VSCodium.

### Default Disabled Settings

The following telemetry-related settings are disabled by default:

```json
{
  "telemetry.telemetryLevel": "off",
  "telemetry.enableCrashReporter": false,
  "telemetry.enableTelemetry": false,
  "telemetry.editStats.enabled": false,
  "workbench.enableExperiments": false,
  "workbench.settings.enableNaturalLanguageSearch": false,
  "workbench.commandPalette.experimental.enableNaturalLanguageSearch": false
}
```

### Update Services

Automatic update checks are also disabled by default:

- `update.mode` is set to `none`
- `update.enableWindowsBackgroundUpdates` is set to `false`
- Extension auto-update settings:
  - `extensions.autoUpdate` is set to `false`
  - `extensions.autoCheckUpdates` is set to `false`

On Linux, the app update service is completely disabled at build-time.

### Feedback Telemetry

The `telemetry.feedback.enabled` setting is kept enabled by default to allow the "Report Issue..." button to function properly without sending any actual telemetry data.

### Checking for Telemetry

To verify that no telemetry is being sent, you can use network monitoring tools:

- **Wireshark** (cross-platform)
- **Little Snitch** (macOS)
- **GlassWire** (Windows)

Look for connections to Microsoft domains and telemetry endpoints.

### CodeCanvas Announcements

The welcome page in CodeCanvas displays announcements that are fetched via the internet from the project's GitHub repository.

To disable this feature, you can disable the preference `workbench.welcomePage.extraAnnouncements`.

### Malicious & Deprecated Extensions

Definitions for malicious and deprecated extensions are dynamically loaded from:
https://raw.githubusercontent.com/EclipseFdn/publish-extensions/refs/heads/master/extension-control/extensions.json

To avoid external connections, you can disable the preference `extensions.excludeUnsafes`, though this is not recommended for security reasons.

## Legal Compliance

CodeCanvas maintains strict legal compliance by:

1. Using only freely available build tools and processes
2. Avoiding any Microsoft trademarks or copyrighted materials
3. Providing clear attribution to all original authors
4. Maintaining the same open-source MIT license as VSCodium and VS Code
5. Ensuring all changes and new assets are legally safe and original

## Extension Compatibility

Most VS Code extensions should work with CodeCanvas, but some extensions may have restrictions:

1. Some extensions have licenses that restrict their use to official Visual Studio Code builds
2. Proprietary debugging tools (like Microsoft's C# and C++ debuggers) may not work
3. Remote development extensions may require special configuration

For proprietary extensions that don't work out of the box, you can add their internal IDs to the `extensionAllowedProposedApi` property in your `product.json` file.