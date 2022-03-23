function Get-GitBranch {
    if(Test-Path ((Get-Location).Path + "./.git/")) {
        return (git rev-parse --abbrev-ref HEAD) 2> $null
    } else {
        return $null;
    }
}