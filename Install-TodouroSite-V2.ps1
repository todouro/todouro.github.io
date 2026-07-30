param(
    [string]$ProjectPath = "C:\Users\devbo\OneDrive\Desktop\ma projects 2\todouro.github.io"
)

$ErrorActionPreference = "Stop"
$BundleRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$BackupRoot = Join-Path $ProjectPath ("_todouro_backup_" + (Get-Date -Format "yyyyMMdd-HHmmss"))

if (-not (Test-Path -LiteralPath $ProjectPath)) {
    throw "Project path does not exist: $ProjectPath"
}

New-Item -ItemType Directory -Path $BackupRoot -Force | Out-Null

foreach ($relative in @("index.html", "assets")) {
    $target = Join-Path $ProjectPath $relative
    if (Test-Path -LiteralPath $target) {
        Copy-Item -LiteralPath $target -Destination $BackupRoot -Recurse -Force
    }
}

Copy-Item -LiteralPath (Join-Path $BundleRoot "index.html") -Destination (Join-Path $ProjectPath "index.html") -Force
New-Item -ItemType Directory -Path (Join-Path $ProjectPath "assets") -Force | Out-Null
Copy-Item -LiteralPath (Join-Path $BundleRoot "assets\games") -Destination (Join-Path $ProjectPath "assets") -Recurse -Force

Write-Host "Todouro Site V2 installed successfully." -ForegroundColor Green
Write-Host "Backup: $BackupRoot"
Write-Host "Preview: $ProjectPath\index.html"
