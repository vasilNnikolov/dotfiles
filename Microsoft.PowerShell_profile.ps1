Set-Alias lvim 'C:\Users\vasil.nikolov\.local\bin\lvim.ps1'
# git related aliases
function Get-GitStatus
{ & git status $args 
}
New-Alias -Name gs -Value Get-GitStatus -Force -Option AllScope
function Get-GitAdd
{ & git add $args 
}
New-Alias -Name ga -Value Get-GitAdd -Force -Option AllScope

function Get-GitDiff
{ & git diff --ignore-space-at-eol $args 
}
New-Alias -Name gd -Value Get-GitDiff -Force -Option AllScope
