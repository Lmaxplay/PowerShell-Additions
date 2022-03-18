try {
if($IsWindows) {
    Copy-Item -Path "./profile.ps1" -Destination ($env:UserProfile + "\Documents\PowerShell\Microsoft.Powershell_profile.ps1")
    Write-Host "Installed succesfully, please restart PowerShell" -ForegroundColor Cyan
} elseif ($IsLinux) {
    New-Item -ItemType Directory -Force -Path ("/home/" + $env:USER + "/.config/powershell/")
    Copy-Item -Path "./profile.ps1" -Destination ("/home/" + $env:USER + "/.config/powershell/Microsoft.PowerShell_profile.ps1") -Force
    Write-Host "Installed succesfully, please restart PowerShell" -ForegroundColor Cyan
}
} catch {
    Write-Host "Install failed" -ForegroundColor Red
}