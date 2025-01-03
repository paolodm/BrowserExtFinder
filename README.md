# BrowserExtFinder

A PowerShell script that scans and inventories browser extensions across Chrome, Firefox, and Edge browsers. The tool provides detailed information including extension names, versions, and file paths in an organized table format.

## Features

- Scans multiple browsers (Chrome, Firefox, Edge)
- Retrieves extension names, versions, IDs, and file paths
- Outputs results in a clean, formatted table
- Error handling for missing browser installations
- Support for default browser profiles

## Requirements

- Windows Operating System
- PowerShell 5.1 or higher
- Administrator privileges may be required for some paths

## Installation

1. Clone the repository:
```powershell
git clone https://github.com/yourusername/BrowserExtensionScanner.git
```

2. Navigate to the script directory:
```powershell
cd BrowserExtensionScanner
```

## Usage

Run the script directly in PowerShell:
```powershell
.\BrowserExtensionScanner.ps1
```

Example output:
```
Browser  Name           Version  ID                                      Path
-------  ----           -------  --                                      ----
Chrome   uBlock Origin  1.52.0   cjpalhdlnbpafiamejdnhcphjbkeiagm      C:\Users\...\Extensions\ublock-origin
Firefox  Dark Reader    4.9.67   addon@darkreader.org                   C:\Users\...\Extensions\darkreader
Edge     LastPass       4.116.0  hdokiejnpimakedhajhdlcegeplioahd      C:\Users\...\Extensions\lastpass
```

## Supported Browsers and Paths

- Google Chrome: `%LOCALAPPDATA%\Google\Chrome\User Data\Default\Extensions`
- Mozilla Firefox: `%APPDATA%\Mozilla\Firefox\Profiles`
- Microsoft Edge: `%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Extensions`

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Thanks to the browser developers for maintaining consistent extension storage structures
- Community feedback and contributions

## Security Notes

- This script only reads extension data and does not modify any browser settings
- No data is collected or transmitted
- Always review scripts before running them on your system