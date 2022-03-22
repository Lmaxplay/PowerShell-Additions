. (Join-Path $PsScriptRoot "Scripts/index.ps1")

Set-Variable -Name "PowerShellAdditionsVersion" -Value (New-Object -TypeName Version -ArgumentList @(1, 3, 2)) -Option Constant -Scope global
Set-Variable -Name "PowerShellAdditionsCodename" -Value "Montreal" -Option Constant -Scope global

try {
    git --version | Out-Null
    $THEME = "THEME_DEFAULT_GIT"
} catch {
    $THEME = "THEME_DEFAULT"
}

$PWSHADDisplayMessage = $true;

$Host.UI.RawUI.windowTitle = ("PowerShell " + ($PSVersionTable.PSVersion.Major.ToString() + "." + $PSVersionTable.PSVersion.Minor.ToString() + "." + $PSVersionTable.PSVersion.Patch.ToString()))

function PWSHADIDMF {
Write-Host -NoNewline "PowerShell Additions" -ForegroundColor:Blue
if($PowerShellAdditionsVersion -ne "") {
    Write-Host -NoNewline " "
}
Write-Host -NoNewline "$PowerShellAdditionsVersion " -ForegroundColor:Blue
Write-Host -NoNewline "($PowerShellAdditionsCodename)" -ForegroundColor:Blue
Write-Host -NoNewline " for PowerShell 7.2.2`n" -ForegroundColor:DarkGray

Write-Host -NoNewline "Made by "
Write-Host -NoNewline "Lmaxplay`n" -ForegroundColor:Green

Write-Host -NoNewline "Updates and source at "
Write-Host -NoNewline "https://github.com/Lmaxplay/PowerShell-Additions`n" -ForegroundColor:Green

#Write-Host -NoNewline "Script is located at "
#Write-Host -NoNewline $MyInvocation.MyCommand.Path -ForegroundColor:Blue
#Write-Host -NoNewline "`n"


if( $IsWindows ) {
    if((New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
        Write-Host -NoNewline "This instance is elevated" -ForegroundColor White
    } else {
        Write-Host -NoNewline "This instance isn't elevated" -ForegroundColor White
    }
}

Write-Host -NoNewline "`n`n"

Write-Host -NoNewline (Get-Random -InputObject $PWSHADTips) -ForegroundColor Green
Write-Host -NoNewline "`n"

if( $PSVersionTable.PSVersion -ne "7.2.2" ) {
    Write-Host -NoNewline "WARNING: POWERSHELL VERSION ISN'T OFFICIALLY SUPPORTED`nUNEXPECTED BEHAVIOR MAY OCCUR" -ForegroundColor:Red
    Write-Host -NoNewline "`n"
}

Write-Host -NoNewline "`n"
}

#Set-Variable -Name "__op__" -Value ${function:prompt} -Option Constant -Scope global # Save the old prompt function so we can disable the custom one

function prompt {

    try {

    if([Environment]::UserInteractive -and (Get-Variable PWSHADDisplayMessage -Scope global -ErrorAction SilentlyContinue)) {
        PWSHADIDMF
        Remove-Variable PWSHADDisplayMessage -Force -Scope global
        #Remove-Item -Path function:\__wr__ -Force -Scope global
    }
    } catch {
        Write-Host -NoNewline ""
    }

    try {
        return Invoke-Expression $THEME
    } catch {
        Write-Host -NoNewline "`nTheme failed to load" -ForegroundColor Red
        return "> ";
    }
}

function Get-PowerShellAdditions-Version {
    return $PowerShellAdditionsVersion
}

function Update-PowerShell-Additions {
    $opath = (Get-Item .).FullName
    Set-Location $env:TEMP
    Remove-Item -Recurse -Force -Path "__TMP__" -ErrorAction SilentlyContinue
    New-Item -Type Directory -Path "__TMP__" -Force -ErrorAction SilentlyContinue
    Set-Location "__TMP__" -ErrorAction Break
    git clone "https://github.com/Lmaxplay/PowerShell-Additions"
    Set-Location "PowerShell-Additions" -ErrorAction Break
    ./install.ps1
    Set-Location "../.." -ErrorAction Break
    Remove-Item -Recurse -Force -Path "__TMP__" -ErrorAction SilentlyContinue
    Set-Location -Path $opath -ErrorAction Break
}

if ((Test-Path (Join-Path $PsScriptRoot "preload.ps1"))) {
    . (Join-Path $PsScriptRoot "preload.ps1");
}

