<#
    .SYNOPSIS
    Sets the theme

    .DESCRIPTION
    Sets the theme to the input Theme

    .PARAMETER Theme
    The theme's name

    .PARAMETER Silent
    If set to true it won't print a message
    
    .EXAMPLE
    Set-Theme THEME_DEFAULT
    
    .EXAMPLE
    Set-Theme THEME_MONOCHROME
#>
function Set-Theme {
    param (
        [String] $Theme,
        [Boolean] $Silent = $false
    )
    $global:THEME = $Theme
    if(!$Silent) {
        Write-Host "Theme set to $global:THEME succesfully" -ForegroundColor Green
    }
}

<#
    .SYNOPSIS
    Sets the theme to the default theme

    .DESCRIPTION
    Sets the theme to the default theme

    .PARAMETER Silent
    If set to true it won't print a message
#>
function Reset-Theme {
    param (
        [bool] $Silent = $false
    )
    $global:THEME = "THEME_DEFAULT"
    if(!$Silent) {
    Write-Host "Theme reset to $global:THEME succesfully" -ForegroundColor Green
    }
}

#region Themes

function THEME_DEFAULT {
    if($IsWindows) {
        $CmdPromptUser = [Security.Principal.WindowsIdentity]::GetCurrent().Name.Split("\")[1];
    } elseif ($IsLinux) {
        $CmdPromptUser = whoami;
    }
    $CmdPromptCurrentFolder = $executionContext.SessionState.Path.CurrentLocation;

    Write-Host -NoNewline "PS " -ForegroundColor Green;
    Write-Host -NoNewline ($PSVersionTable.PSVersion.Major.ToString() + "." + $PSVersionTable.PSVersion.Minor.ToString()) -ForegroundColor Green;
    Write-Host -NoNewline " ";
    Write-Host -NoNewline ($CmdPromptUser.ToString() + " ") -ForegroundColor Blue;
    
    if("$CmdPromptCurrentFolder".Contains(" ")) {
        Write-Host -NoNewline ("`"" + $CmdPromptCurrentFolder.ToString() + "`"") -ForegroundColor Magenta;
    } else {
        Write-Host -NoNewline $CmdPromptCurrentFolder.ToString() -ForegroundColor Magenta;
    }
    Write-Host -NoNewline ">" -ForegroundColor White;
    return " ";
}

function THEME_DEFAULT_GIT {
    if($IsWindows) {
        $CmdPromptUser = [Security.Principal.WindowsIdentity]::GetCurrent().Name.Split("\")[1];
    } elseif ($IsLinux) {
        $CmdPromptUser = whoami;
    }
    $CmdPromptCurrentFolder = $executionContext.SessionState.Path.CurrentLocation;

    Write-Host -NoNewline "PS " -ForegroundColor "Green";
    Write-Host -NoNewline ($PSVersionTable.PSVersion.Major.ToString() + "." + $PSVersionTable.PSVersion.Minor.ToString()) -ForegroundColor Green;
    Write-Host -NoNewline " ";
    Write-Host -NoNewline ($CmdPromptUser.ToString() + " ") -ForegroundColor Blue;

    $branch = (Get-GitBranch)

    if($null -ne $branch) {
        Write-Host -NoNewline ( "" + ($branch) + " " ) -ForegroundColor Red
    }

    if("$CmdPromptCurrentFolder".Contains(" ")) {
        Write-Host -NoNewline ("`"" + $CmdPromptCurrentFolder.ToString() + "`"") -ForegroundColor Magenta;
    } else {
        Write-Host -NoNewline $CmdPromptCurrentFolder.ToString() -ForegroundColor Magenta;
    }

    Write-Host -NoNewline -ForegroundColor:White ">";
    return " ";
}

function THEME_DEFAULT_NL {
    if($IsWindows) {
        $CmdPromptUser = [Security.Principal.WindowsIdentity]::GetCurrent().Name.Split("\")[1];
    } elseif ($IsLinux) {
        $CmdPromptUser = whoami;
    }
    $CmdPromptCurrentFolder = $executionContext.SessionState.Path.CurrentLocation;

    Write-Host -NoNewline "PS " -ForegroundColor Green;
    Write-Host -NoNewline ($PSVersionTable.PSVersion.Major.ToString() + "." + $PSVersionTable.PSVersion.Minor.ToString()) -ForegroundColor Green;
    Write-Host -NoNewline " ";
    Write-Host -NoNewline ($CmdPromptUser.ToString() + " ") -ForegroundColor Blue;
    
    if("$CmdPromptCurrentFolder".Contains(" ")) {
        Write-Host -NoNewline ("`"" + $CmdPromptCurrentFolder.ToString() + "`"") -ForegroundColor Magenta;
    } else {
        Write-Host -NoNewline $CmdPromptCurrentFolder.ToString() -ForegroundColor Magenta;
    }
    Write-Host -NoNewline "`n>" -ForegroundColor White;
    return " ";
}

function THEME_DEFAULT_GIT_NL {
    if($IsWindows) {
        $CmdPromptUser = [Security.Principal.WindowsIdentity]::GetCurrent().Name.Split("\")[1];
    } elseif ($IsLinux) {
        $CmdPromptUser = whoami;
    }
    $CmdPromptCurrentFolder = $executionContext.SessionState.Path.CurrentLocation;

    Write-Host -NoNewline "PS " -ForegroundColor "Green";
    Write-Host -NoNewline ($PSVersionTable.PSVersion.Major.ToString() + "." + $PSVersionTable.PSVersion.Minor.ToString()) -ForegroundColor Green;
    Write-Host -NoNewline " ";
    Write-Host -NoNewline ($CmdPromptUser.ToString() + " ") -ForegroundColor Blue;

    $branch = (Get-GitBranch)

    if($null -ne $branch) {
        Write-Host -NoNewline ( "" + ($branch) + " " ) -ForegroundColor Red
    }

    if("$CmdPromptCurrentFolder".Contains(" ")) {
        Write-Host -NoNewline ("`"" + $CmdPromptCurrentFolder.ToString() + "`"") -ForegroundColor Magenta;
    } else {
        Write-Host -NoNewline $CmdPromptCurrentFolder.ToString() -ForegroundColor Magenta;
    }

    Write-Host -NoNewline -ForegroundColor:White "`n>";
    return " ";
}

function THEME_MONOCHROME {
    if($IsWindows) {
        $CmdPromptUser = [Security.Principal.WindowsIdentity]::GetCurrent().Name.Split("\")[1];
    } elseif ($IsLinux) {
        $CmdPromptUser = whoami;
    }
    $CmdPromptCurrentFolder = $executionContext.SessionState.Path.CurrentLocation;

    Write-Host -NoNewline "PS ";
    Write-Host -NoNewline ($PSVersionTable.PSVersion.Major.ToString() + "." + $PSVersionTable.PSVersion.Minor.ToString());
    Write-Host -NoNewline " ";
    Write-Host -NoNewline ($CmdPromptUser.ToString() + " ");
    
    if("$CmdPromptCurrentFolder".Contains(" ")) {
        Write-Host -NoNewline ("`"" + $CmdPromptCurrentFolder.ToString() + "`"");
    } else {
        Write-Host -NoNewline $CmdPromptCurrentFolder.ToString();
    }
    Write-Host -NoNewline ">";
    return " ";
}

function THEME_MONOCHROME_NL {
    if($IsWindows) {
        $CmdPromptUser = [Security.Principal.WindowsIdentity]::GetCurrent().Name.Split("\")[1];
    } elseif ($IsLinux) {
        $CmdPromptUser = whoami;
    }
    $CmdPromptCurrentFolder = $executionContext.SessionState.Path.CurrentLocation;

    Write-Host -NoNewline "PS ";
    Write-Host -NoNewline ($PSVersionTable.PSVersion.Major.ToString() + "." + $PSVersionTable.PSVersion.Minor.ToString());
    Write-Host -NoNewline " ";
    Write-Host -NoNewline ($CmdPromptUser.ToString() + " ");
    
    if("$CmdPromptCurrentFolder".Contains(" ")) {
        Write-Host -NoNewline ("`"" + $CmdPromptCurrentFolder.ToString() + "`"");
    } else {
        Write-Host -NoNewline $CmdPromptCurrentFolder.ToString();
    }
    Write-Host -NoNewline "`n>";
    return " ";
}

function THEME_MAGENTA {
    if($IsWindows) {
        $CmdPromptUser = [Security.Principal.WindowsIdentity]::GetCurrent().Name.Split("\")[1];
    } elseif ($IsLinux) {
        $CmdPromptUser = whoami;
    }
    $CmdPromptCurrentFolder = $executionContext.SessionState.Path.CurrentLocation;

    Write-Host -NoNewline "PS " -ForegroundColor DarkMagenta;
    Write-Host -NoNewline ($PSVersionTable.PSVersion.Major.ToString() + "." + $PSVersionTable.PSVersion.Minor.ToString()) -ForegroundColor DarkMagenta;
    Write-Host -NoNewline " ";
    Write-Host -NoNewline ($CmdPromptUser.ToString() + " ") -ForegroundColor DarkMagenta;
    
    if("$CmdPromptCurrentFolder".Contains(" ")) {
        Write-Host -NoNewline ("`"" + $CmdPromptCurrentFolder.ToString() + "`"") -ForegroundColor Magenta;
    } else {
        Write-Host -NoNewline $CmdPromptCurrentFolder.ToString() -ForegroundColor Magenta;
    }
    Write-Host -NoNewline ">" -ForegroundColor White;
    return " ";
}

function THEME_MAGENTA_NL {
    if($IsWindows) {
        $CmdPromptUser = [Security.Principal.WindowsIdentity]::GetCurrent().Name.Split("\")[1];
    } elseif ($IsLinux) {
        $CmdPromptUser = whoami;
    }
    $CmdPromptCurrentFolder = $executionContext.SessionState.Path.CurrentLocation;

    Write-Host -NoNewline "PS " -ForegroundColor DarkMagenta;
    Write-Host -NoNewline ($PSVersionTable.PSVersion.Major.ToString() + "." + $PSVersionTable.PSVersion.Minor.ToString()) -ForegroundColor DarkMagenta;
    Write-Host -NoNewline " ";
    Write-Host -NoNewline ($CmdPromptUser.ToString() + " ") -ForegroundColor DarkMagenta;
    
    if("$CmdPromptCurrentFolder".Contains(" ")) {
        Write-Host -NoNewline ("`"" + $CmdPromptCurrentFolder.ToString() + "`"") -ForegroundColor Magenta;
    } else {
        Write-Host -NoNewline $CmdPromptCurrentFolder.ToString() -ForegroundColor Magenta;
    }
    Write-Host -NoNewline "`n>" -ForegroundColor White;
    return " ";
}

function THEME_MINI {
    if($IsWindows) {
        $CmdPromptUser = [Security.Principal.WindowsIdentity]::GetCurrent().Name.Split("\")[1];
    } elseif ($IsLinux) {
        $CmdPromptUser = whoami;
    }
    $CmdPromptCurrentFolder = $executionContext.SessionState.Path.CurrentLocation;

    if("$CmdPromptCurrentFolder".Contains(" ")) {
        Write-Host -NoNewline ("`"" + $CmdPromptCurrentFolder.ToString() + "`"") -ForegroundColor Green;
    } else {
        Write-Host -NoNewline $CmdPromptCurrentFolder.ToString() -ForegroundColor Green;
    }
    Write-Host -NoNewline -ForegroundColor:White ">";
    return " ";
}

function THEME_MINI_NL {
    if($IsWindows) {
        $CmdPromptUser = [Security.Principal.WindowsIdentity]::GetCurrent().Name.Split("\")[1];
    } elseif ($IsLinux) {
        $CmdPromptUser = whoami;
    }
    $CmdPromptCurrentFolder = $executionContext.SessionState.Path.CurrentLocation;

    if("$CmdPromptCurrentFolder".Contains(" ")) {
        Write-Host -NoNewline ("`"" + $CmdPromptCurrentFolder.ToString() + "`"") -ForegroundColor Green;
    } else {
        Write-Host -NoNewline $CmdPromptCurrentFolder.ToString() -ForegroundColor Green;
    }
    Write-Host -NoNewline -ForegroundColor:White "`n>";
    return " ";
}

function THEME_PSDEFAULT {
    return "PS $($executionContext.SessionState.Path.CurrentLocation)$('>' * ($nestedPromptLevel + 1)) ";
}

function THEME_PSDEFAULT_NL {
    return "PS $($executionContext.SessionState.Path.CurrentLocation)$("`n>" * ($nestedPromptLevel + 1)) ";
}

function THEME_PSDEFAULT_COLOR {
    Write-Host -NoNewline "PS $($executionContext.SessionState.Path.CurrentLocation)" -ForegroundColor Cyan
    return "$('>' * ($nestedPromptLevel + 1)) ";
}

function THEME_PSDEFAULT_COLOR_NL {
    Write-Host -NoNewline "PS $($executionContext.SessionState.Path.CurrentLocation)" -ForegroundColor Cyan
    return "$("`n>" * ($nestedPromptLevel + 1)) ";
}

function THEME_CMD {
    Write-Host -NoNewline "$($executionContext.SessionState.Path.CurrentLocation)" -ForegroundColor White
    Write-Host -NoNewline "$('>' * ($nestedPromptLevel + 1))" -ForegroundColor White
    return " ";
}

function THEME_BASH {
    if($IsWindows) {
        $CmdPromptUser = [Security.Principal.WindowsIdentity]::GetCurrent().Name.Split("\")[1];
        #$CmdPromptPC = [System.Net.Dns]::GetHostName();
        $CmdPromptPC = [Security.Principal.WindowsIdentity]::GetCurrent().Name.Split("\")[0];
    } elseif ($IsLinux) {
        $CmdPromptUser = whoami;
    }
    $CmdPromptCurrentFolder = $executionContext.SessionState.Path.CurrentLocation;

    Write-Host -NoNewline ($CmdPromptUser.ToString() + "@") -ForegroundColor Green;
    
    Write-Host -NoNewline ($CmdPromptPC.ToString()) -ForegroundColor Green;

    Write-Host -NoNewline ":" -ForegroundColor White;

    if((Get-Location).Path.StartsWith($env:USERPROFILE)) {
        Write-Host -NoNewline $CmdPromptCurrentFolder.ToString().Replace($env:USERPROFILE, "~") -ForegroundColor Blue;
    } else {
        Write-Host -NoNewline $CmdPromptCurrentFolder.ToString() -ForegroundColor Blue;
    }

    Write-Host -NoNewline -ForegroundColor:White "$";
    return " ";
}

function THEME_BASH_MONOCHROME {
    if($IsWindows) {
        $CmdPromptUser = [Security.Principal.WindowsIdentity]::GetCurrent().Name.Split("\")[1];
        #$CmdPromptPC = [System.Net.Dns]::GetHostName();
        $CmdPromptPC = [Security.Principal.WindowsIdentity]::GetCurrent().Name.Split("\")[0];
    } elseif ($IsLinux) {
        $CmdPromptUser = whoami;
    }
    $CmdPromptCurrentFolder = $executionContext.SessionState.Path.CurrentLocation;

    Write-Host -NoNewline ($CmdPromptUser.ToString() + "@");
    
    Write-Host -NoNewline ($CmdPromptPC.ToString());

    Write-Host -NoNewline ":";

    if((Get-Location).Path.StartsWith($env:USERPROFILE)) {
        Write-Host -NoNewline $CmdPromptCurrentFolder.ToString().Replace($env:USERPROFILE, "~");
    } else {
        Write-Host -NoNewline $CmdPromptCurrentFolder.ToString();
    }

    Write-Host -NoNewline -ForegroundColor:White "$";
    return " ";
}

function THEME_BASH_NL {
    if($IsWindows) {
        $CmdPromptUser = [Security.Principal.WindowsIdentity]::GetCurrent().Name.Split("\")[1];
        #$CmdPromptPC = [System.Net.Dns]::GetHostName();
        $CmdPromptPC = [Security.Principal.WindowsIdentity]::GetCurrent().Name.Split("\")[0];
    } elseif ($IsLinux) {
        $CmdPromptUser = whoami;
    }
    $CmdPromptCurrentFolder = $executionContext.SessionState.Path.CurrentLocation;

    Write-Host -NoNewline ($CmdPromptUser.ToString() + "@") -ForegroundColor Green;
    
    Write-Host -NoNewline ($CmdPromptPC.ToString()) -ForegroundColor Green;

    Write-Host -NoNewline ":" -ForegroundColor White;

    if((Get-Location).Path.StartsWith($env:USERPROFILE)) {
        Write-Host -NoNewline $CmdPromptCurrentFolder.ToString().Replace($env:USERPROFILE, "~") -ForegroundColor Blue;
    } else {
        Write-Host -NoNewline $CmdPromptCurrentFolder.ToString() -ForegroundColor Blue;
    }

    Write-Host -NoNewline -ForegroundColor:White "`n$";
    return " ";
}

function THEME_BASH_MONOCHROME_NL {
    if($IsWindows) {
        $CmdPromptUser = [Security.Principal.WindowsIdentity]::GetCurrent().Name.Split("\")[1];
        #$CmdPromptPC = [System.Net.Dns]::GetHostName();
        $CmdPromptPC = [Security.Principal.WindowsIdentity]::GetCurrent().Name.Split("\")[0];
    } elseif ($IsLinux) {
        $CmdPromptUser = whoami;
    }
    $CmdPromptCurrentFolder = $executionContext.SessionState.Path.CurrentLocation;

    Write-Host -NoNewline ($CmdPromptUser.ToString() + "@");
    
    Write-Host -NoNewline ($CmdPromptPC.ToString());

    Write-Host -NoNewline ":";

    if((Get-Location).Path.StartsWith($env:USERPROFILE)) {
        Write-Host -NoNewline $CmdPromptCurrentFolder.ToString().Replace($env:USERPROFILE, "~");
    } else {
        Write-Host -NoNewline $CmdPromptCurrentFolder.ToString();
    }

    Write-Host -NoNewline -ForegroundColor:White "`n$";
    return " ";
}

function THEME_BASH_MAGENTA {
    if($IsWindows) {
        $CmdPromptUser = [Security.Principal.WindowsIdentity]::GetCurrent().Name.Split("\")[1];
        $CmdPromptPC = [Security.Principal.WindowsIdentity]::GetCurrent().Name.Split("\")[0];
    } elseif ($IsLinux) {
        $CmdPromptUser = whoami;
    }
    $CmdPromptCurrentFolder = $executionContext.SessionState.Path.CurrentLocation;

    Write-Host -NoNewline ($CmdPromptUser.ToString() + "@") -ForegroundColor Magenta;
    
    Write-Host -NoNewline ($CmdPromptPC.ToString()) -ForegroundColor Magenta;

    Write-Host -NoNewline ":" -ForegroundColor White;

    Write-Host -NoNewline $CmdPromptCurrentFolder.ToString() -ForegroundColor DarkMagenta;
    Write-Host -NoNewline -ForegroundColor:White "$";
    return " ";
}

function THEME_BASH_MAGENTA_NL {
    if($IsWindows) {
        $CmdPromptUser = [Security.Principal.WindowsIdentity]::GetCurrent().Name.Split("\")[1];
        $CmdPromptPC = [Security.Principal.WindowsIdentity]::GetCurrent().Name.Split("\")[0];
    } elseif ($IsLinux) {
        $CmdPromptUser = whoami;
    }
    $CmdPromptCurrentFolder = $executionContext.SessionState.Path.CurrentLocation;

    Write-Host -NoNewline ($CmdPromptUser.ToString() + "@") -ForegroundColor Magenta;
    
    Write-Host -NoNewline ($CmdPromptPC.ToString()) -ForegroundColor Magenta;

    Write-Host -NoNewline ":" -ForegroundColor White;

    Write-Host -NoNewline $CmdPromptCurrentFolder.ToString() -ForegroundColor DarkMagenta;
    Write-Host -NoNewline -ForegroundColor:White "`n$";
    return " ";
}


function THEME_ARROW {
    Write-Host -NoNewline -ForegroundColor:Yellow "➜";
    return " ";
}

function THEME_AMRO {
    if($IsWindows) {
        $CmdPromptUser = [Security.Principal.WindowsIdentity]::GetCurrent().Name.Split("\")[1];
    } elseif ($IsLinux) {
        $CmdPromptUser = whoami;
    }
    $CmdPromptCurrentFolder = $executionContext.SessionState.Path.CurrentLocation;

    Write-Host -NoNewline "PS " -ForegroundColor "Green";
    Write-Host -NoNewline ($PSVersionTable.PSVersion.Major.ToString() + "." + $PSVersionTable.PSVersion.Minor.ToString()) -ForegroundColor Green;
    Write-Host -NoNewline " ";
    Write-Host -NoNewline ($CmdPromptUser.ToString() + " ") -ForegroundColor Blue;
    
    $branch = (Get-GitBranch)

    if($null -ne $branch) {
        Write-Host -NoNewline ( "" + ($branch) + " ") -ForegroundColor Red
    }


    if("$CmdPromptCurrentFolder".Contains(" ")) {
        Write-Host -NoNewline ("`"" + $CmdPromptCurrentFolder.ToString() + "`"") -ForegroundColor Magenta;
    } else {
        Write-Host -NoNewline $CmdPromptCurrentFolder.ToString() -ForegroundColor Magenta;
    }

    Write-Host -NoNewline -ForegroundColor:White "`n";
    return " ";
}

#endregion Themes