# --- Remove Windows 11 bloatware apps ---
$apps = @(
    "Microsoft.BingNews",
    "Microsoft.MicrosoftOfficeHub",
    "Microsoft.XboxApp",
    "Microsoft.Xbox.TCUI",
    "Microsoft.XboxGamingOverlay",
    "Microsoft.XboxGameOverlay",
    "Microsoft.XboxIdentityProvider",
    "Microsoft.ZuneMusic",
    "Microsoft.ZuneVideo",
    "Microsoft.GetHelp",
    "Microsoft.Getstarted",
    "Microsoft.MicrosoftSolitaireCollection",
    "Microsoft.People",
    "Microsoft.WindowsMaps",
    "Microsoft.WindowsFeedbackHub",
    "MicrosoftTeams",
    "Microsoft.YourPhone",
    "Microsoft.Clipchamp",
    "Microsoft.Todos",
    "Microsoft.WebExperience"  # Widgets
)

foreach ($app in $apps) {
    Write-Host "Removing...: $app" -ForegroundColor Yellow
    Get-AppxPackage -Name $app -AllUsers | Remove-AppxPackage -AllUsers
     Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like $app | Remove-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue
}

Write-Host "=== Disabling Telemetry & Unneeded Services ===" -ForegroundColor Cyan
$services = @(
    "DiagTrack",
    "dmwappushservice",
    "edgeupdate",
    "edgeupdatem"
)
foreach ($svc in $services) {
    sc stop $svc
    sc config $svc start= disabled
}


# Tắt Ads/Recommendations trong Start, Settings, Explorer
Write-Host "=== Cleaning Registry Ads & Recommendations ===" -ForegroundColor Cyan
$regEdits = @(
    'HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced',
    'HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager'
)
# Start Menu
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_TrackProgs /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_IrisRecommendations /t REG_DWORD /d 0 /f

# File Explorer
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowSyncProviderNotifications /t REG_DWORD /d 0 /f

# Settings ads
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338388Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-310093Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-314559Enabled /t REG_DWORD /d 0 /f

Write-Host "=== Done! Please restart your PC. ===" -ForegroundColor Green