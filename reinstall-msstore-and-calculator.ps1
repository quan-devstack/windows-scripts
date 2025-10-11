Get-AppxPackage -allusers *WindowsStore* | Foreach {
    Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppxManifest.xml"
}

Get-AppxPackage -allusers *WindowsCalculator* | Foreach {
    Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppxManifest.xml"
}
