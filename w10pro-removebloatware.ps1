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
    "Microsoft.OneConnect"
)