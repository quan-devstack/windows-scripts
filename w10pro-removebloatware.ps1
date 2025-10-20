# =====
# Windows 10 Pro Bloatware Removal Script
# Made For PowerShell (Run as Administrators)
# =====

Write-Host "=== Remove Default Bloatware in Windows 10 Pro ===" -ForegroundColor Cyan

#  Bloatware App List
$BloatApps = @(
    "Microsoft.3DBuilDer",
    "Microsoft.XboxApp",
    "Microsoft.XboxGamingOverlay",
    "Microsoft.XboxGameOverlay",
    "Microsoft.XboxIdentityProvider",
    "Microsoft.XboxSpeechToTextOverlay",
    "Microsoft.Microsoft3DViewer",
    "Microsoft.MixedReality.Portal",
    "Microsoft.GetHelp",
    "Microsoft.OneConnect",
    "Microsoft.People",
    "Microsoft.SkypeApp",
    "Microsoft.MicrosoftSolitaireCollection",
    "Microsoft.BingWeather",
    "Microsoft.ZuneMusic",
    "Microsoft.ZubeVideo",
    "Microsoft.News",
    "Microsoft.MicrosoftStickyNotes",
    "Microsoft.Todos",
    "Microsoft.YourPhone",
    "Microsoft.MSPaint",
    "Microsoft.MicrosoftPowerBIForWindows",
    "Microsoft.Advertising.Xaml",
    "Microsoft.WindowsMaps",
    "Microsoft.WindowsMaps",
    "Microsoft.OneNote",
    "Microsoft.MicrosoftJournal",
    "Microsoft.Wallet",
    "Microsoft.ScreenSketch",
    "Microsoft.LinkedIn"
)

# Gỡ từng App
foreach ($app in $BloatApps) {
    Write-Host "Removing...: $app" -ForegroundColor Yellow
    Get-AppxPackage -Name $app -AllUsers | Remove-AppPackage -ErrorAction SilentlyContinue
    Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like $app | Remove-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue
}

Write-Host "=== Bloatware Removed! ===" -ForegroundColor Green

# Dọn dẹp các package còn sót
# Write-Host "Cleaning AppX Package..." -ForegroundColor Cyan
# Get-AppxPackage | Where-Object {$_.NonRemovable -eq $false} | Remove-AppPackage -ErrorAction SilentlyContinue

# Xóa quảng cáo & đề xuất trong Start Menu / Settings
Write-Host "Disable Adversiting & Suggestions..." -ForegroundColor Cyan

# Tắt đề xuất trong Start Menu
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SystemPaneSuggestionsEnabled /t REG_DWORD /d 0 /f

# Tắt quảng cáo trong Settings
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v Enabled /t REG_DWORD /d 0 /f

# Tắt tips
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\UserProfileEngagement" /v ScoobeSystemSettingEnabled /t REG_DWORD /d 0 /f

# Tắt Microsoft Consumer Experience
reg add "HKLM\Software\Policies\Microsoft\Windows\CloudContent" /v DisableConsumerAccountStateContent /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\CloudContent" /v DisableWindowsConsumerFeatures /t REG_DWORD /d 1 /f

Write-Host "=== Clean Completed! Restart the computer to commit changes. ===" -ForegroundColor Green