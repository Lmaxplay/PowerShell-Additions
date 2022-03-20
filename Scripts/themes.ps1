function Set-Theme([string]$theme) {
    $global:THEME = $theme
    Write-Host "Theme set to $global:THEME succesfully" -ForegroundColor Green
}

function Reset-Theme {
    $global:THEME = "THEME_DEFAULT"
    Write-Host "Theme reset to $global:THEME succesfully" -ForegroundColor Green
}
function THEME_DEFAULT {
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
    
    if("$CmdPromptCurrentFolder".Contains(" ")) {
        Write-Host -NoNewline ("`"" + $CmdPromptCurrentFolder.ToString() + "`"") -ForegroundColor Magenta;
    } else {
        Write-Host -NoNewline $CmdPromptCurrentFolder.ToString() -ForegroundColor Magenta;
    }
    Write-Host -NoNewline -ForegroundColor:White ">";
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

function THEME_PSDEFAULT {
    return "PS $($executionContext.SessionState.Path.CurrentLocation)$('>' * ($nestedPromptLevel + 1)) ";
}

function THEME_PSDEFAULT_COLOR {
    Write-Host -NoNewline "PS $($executionContext.SessionState.Path.CurrentLocation)" -ForegroundColor Cyan
    return "$('>' * ($nestedPromptLevel + 1)) ";
}

function THEME_CMD {
    Write-Host -NoNewline "$($executionContext.SessionState.Path.CurrentLocation)" -ForegroundColor White
    return "$('>' * ($nestedPromptLevel + 1)) ";
}

function THEME_BASH {
    if($IsWindows) {
        $CmdPromptUser = [Security.Principal.WindowsIdentity]::GetCurrent().Name.Split("\")[1];
        $CmdPromptPC = [Security.Principal.WindowsIdentity]::GetCurrent().Name.Split("\")[0];
    } elseif ($IsLinux) {
        $CmdPromptUser = whoami;
    }
    $CmdPromptCurrentFolder = $executionContext.SessionState.Path.CurrentLocation;

    Write-Host -NoNewline ($CmdPromptUser.ToString() + "@") -ForegroundColor Green;
    
    Write-Host -NoNewline ($CmdPromptPC.ToString()) -ForegroundColor Green;

    Write-Host -NoNewline ":" -ForegroundColor White

    Write-Host -NoNewline $CmdPromptCurrentFolder.ToString() -ForegroundColor Blue;
    Write-Host -NoNewline -ForegroundColor:White "$";
    return " ";
}
