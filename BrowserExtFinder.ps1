# Script to find browser extensions across different browsers
$extensions = @()

# Chrome extensions
$chromePath = "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Extensions"
if (Test-Path $chromePath) {
    $chromeExts = Get-ChildItem -Path $chromePath -Directory | ForEach-Object {
        $manifestPath = Join-Path $_.FullName "*\manifest.json" -Resolve -ErrorAction SilentlyContinue
        if ($manifestPath) {
            $manifest = Get-Content $manifestPath | ConvertFrom-Json
            [PSCustomObject]@{
                Browser = "Chrome"
                Name = $manifest.name
                Version = $manifest.version
                ID = $_.Name
                Path = $_.FullName
            }
        }
    }
    $extensions += $chromeExts
}

# Firefox extensions
$firefoxProfiles = "$env:APPDATA\Mozilla\Firefox\Profiles"
if (Test-Path $firefoxProfiles) {
    Get-ChildItem $firefoxProfiles -Directory | ForEach-Object {
        $extensionsFile = Join-Path $_.FullName "extensions.json"
        if (Test-Path $extensionsFile) {
            $foxExts = Get-Content $extensionsFile | ConvertFrom-Json
            $foxExts.addons | ForEach-Object {
                $extensions += [PSCustomObject]@{
                    Browser = "Firefox"
                    Name = $_.defaultLocale.name
                    Version = $_.version
                    ID = $_.id
                    Path = $_.path
                }
            }
        }
    }
}

# Edge extensions
$edgePath = "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Extensions"
if (Test-Path $edgePath) {
    $edgeExts = Get-ChildItem -Path $edgePath -Directory | ForEach-Object {
        $manifestPath = Join-Path $_.FullName "*\manifest.json" -Resolve -ErrorAction SilentlyContinue
        if ($manifestPath) {
            $manifest = Get-Content $manifestPath | ConvertFrom-Json
            [PSCustomObject]@{
                Browser = "Edge"
                Name = $manifest.name
                Version = $manifest.version
                ID = $_.Name
                Path = $_.FullName
            }
        }
    }
    $extensions += $edgeExts
}

# Output results
$extensions | Format-Table Browser, Name, Version, ID, Path -AutoSize