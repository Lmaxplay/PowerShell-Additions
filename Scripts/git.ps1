function Get-GitBranch {
    return (git rev-parse --abbrev-ref HEAD) 2> $null
}