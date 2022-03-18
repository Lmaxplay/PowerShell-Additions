$PWSHAD_VERSION = "v1.0.0"

Write-Host -NoNewline "PowerShell additions" -ForegroundColor:Blue
if($PWSHAD_VERSION -ne "") {
    Write-Host -NoNewline " "
}
Write-Host -NoNewline "$PWSHAD_VERSION" -ForegroundColor:Blue
Write-Host -NoNewline " for PowerShell 7.2.2`n" -ForegroundColor:DarkGray

Write-Host -NoNewline "Made by "
Write-Host -NoNewline "Lmaxplay`n" -ForegroundColor:Green

#Write-Host -NoNewline "Script is located at "
#Write-Host -NoNewline $MyInvocation.MyCommand.Path -ForegroundColor:Blue
#Write-Host -NoNewline "`n"

if( $PSVersionTable.PSVersion -ne "7.2.2" ) {
    Write-Host -NoNewline "WARNING: POWERSHELL VERSION ISN'T OFFICIALLY SUPPORTED`nUNEXPECTED BEHAVIOR MAY OCCUR" -ForegroundColor:Red
    Write-Host -NoNewline "`n"
}

if( $IsWindows ) {
    if((New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
        Write-Host -NoNewline "This instance isn't elevated" -ForegroundColor White
    } else {
        Write-Host -NoNewline "This instance is elevated" -ForegroundColor White
    }
}

Write-Host -NoNewline ""

Write-Host -NoNewline "`n`n"

$__prfen__ = $true

Set-Variable -Name "__op__" -Value ${function:prompt} -Option Constant -Scope global # Save the old prompt function so we can disable the custom one

function prompt {
    if($global:__prfen__ -eq $false) {
        $scriptBlock = [Scriptblock]::Create($__op__)
        return Invoke-Command -ScriptBlock $scriptBlock
    }
    if($IsWindows) {
        $CmdPromptUser = [Security.Principal.WindowsIdentity]::GetCurrent().Name.Split("\")[1];
    } elseif ($IsLinux) {
        $CmdPromptUser = whoami
    }
    $CmdPromptCurrentFolder = $executionContext.SessionState.Path.CurrentLocation;

    Write-Host -NoNewline "PS " -ForegroundColor "Green"
    Write-Host -NoNewline ($PSVersionTable.PSVersion.Major.ToString() + "." + $PSVersionTable.PSVersion.Minor.ToString()) -ForegroundColor Green
    Write-Host -NoNewline " "
    Write-Host -NoNewline ($CmdPromptUser.ToString() + " ") -ForegroundColor Blue
    
    if("$CmdPromptCurrentFolder".Contains(" ")) {
        Write-Host -NoNewline ("`"" + $CmdPromptCurrentFolder.ToString() + "`"") -ForegroundColor Magenta
    } else {
        Write-Host -NoNewline $CmdPromptCurrentFolder.ToString() -ForegroundColor Magenta
    }
    Write-Host -NoNewline -ForegroundColor:White ">"
    return " ";
}

function Disable-Profile {
    <#
    .DESCRIPTION
    Disables the PowerShell Additions profile
    #>
    $global:__prfen__ = $false;
    if($global:__prfen__) {return}; #Fix VSCode being annoying
}

function Enable-Profile {
    <#
    .DESCRIPTION
    Enables the PowerShell Additions profile
    #>
    $global:__prfen__ = $true;
    if($global:__prfen__) {return;}; #Fix VSCode being annoying
}

Disable-Profile