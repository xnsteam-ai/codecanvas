# Building CodeCanvas on Windows

## Prerequisites

1. **Git for Windows** - Download from https://git-scm.com/download/win
2. **Node.js** - Download from https://nodejs.org/ (LTS version recommended)
3. **Python 3** - Download from https://www.python.org/downloads/
4. **7-Zip** - Download from https://www.7-zip.org/
5. **WiX Toolset** - Download from https://wixtoolset.org/

## Installation Steps

1. Install all prerequisites
2. Add the following to your PATH environment variable:
   - Git bin directory (usually `C:\Program Files\Git\bin`)
   - Node.js directory (usually `C:\Program Files\nodejs`)
   - Python directory (usually `C:\Python39` or similar)
   - 7-Zip directory (usually `C:\Program Files\7-Zip`)

## Building CodeCanvas

1. Open Git Bash (or Command Prompt)
2. Navigate to the CodeCanvas directory:
   ```bash
   cd path\to\codecanvas
   ```

3. Run the build script:
   ```bash
   ./dev/build.sh
   ```

4. For a production build with packaging:
   ```bash
   ./dev/build.sh -p
   ```

## Troubleshooting

### PowerShell Execution Policy Error

If you get an error about execution policy when running scripts, run this command in PowerShell as Administrator:

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### Missing Dependencies

If you get errors about missing dependencies, make sure all prerequisites are installed and added to your PATH.

### Build Failures

If the build fails, try cleaning the workspace:

```bash
git clean -xdf
npm install
./dev/build.sh
```