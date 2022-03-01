Import-Module -Name posh-git
Import-Module Get-ChildItemColor

#Set-Alias ls Get-ChildItem-Color -option AllScope -Force
#Set-Alias dir Get-ChildItem-Color -option AllScope -Force

function prompt {
    Write-Host "μ " -NoNewline

    Write-Host $($(Get-Location) -replace ($env:USERPROFILE).Replace('\','\\'), "~") -NoNewline -ForegroundColor Blue
    
    Write-Host " " -NoNewline -ForegroundColor DarkGray

    Write-VcsStatus

    return "$ "
}
