try {
if($IsWindows) {
    New-Item -ItemType Directory "C:\Users\Lmaxplay\Documents\PowerShell\" -Force -ErrorAction SilentlyContinue > $null
    Copy-Item -Path "./profile.ps1" -Destination ($env:UserProfile + "\Documents\PowerShell\Microsoft.Powershell_profile.ps1")
    New-Item -ItemType Directory "C:\Users\Lmaxplay\Documents\PowerShell\Scripts\" -Force -ErrorAction SilentlyContinue > $null
    Copy-Item -Recurse -Path ".\Scripts\*" -Destination ($env:UserProfile + "\Documents\PowerShell\Scripts\") -Force
    #Copy-Item -Path "./profile.ps1" -Destination ($env:UserProfile + "\Documents\PowerShell\Microsoft.VSCode_profile.ps1") #! Disabled since ( PowerShell Integrated Console ) is better without the addons
    Write-Host "Installed succesfully, please restart PowerShell" -ForegroundColor Cyan
} elseif ($IsLinux) {
    Remove-Item -Recurse -Force -Path ("/home/" + $env:USER + "/.config/powershell/")
    #Copy-Item -Path "./profile.ps1" -Destination ("/home/" + $env:USER + "/.config/powershell/Microsoft.PowerShell_profile.ps1") -Force
    #Copy-Item -Path "./Scripts" -Destination ("/home/" + $env:USER + "/.config/powershell/") -Force
    Write-Host "Install failed, Linux isn't supported" -ForegroundColor Red
}
} catch {
    Write-Host "Install failed" -ForegroundColor Red
}