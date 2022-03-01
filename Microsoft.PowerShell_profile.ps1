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

function showGitStatus { & git status $args}
function showGitLog { & git log $args}
function showGitLogPretty { & git log --graph --oneline --decorate}
function doGitCheckoutMain { & git checkout main $args}
function doGitCheckoutDev { & git checkout dev $args}
function doGitAddAll{ & git add . $args}
function doGitCommitMessage {& git commit -m $args}
function doGitCommitAllMessage {& git commit -a -m $args}
function doGitPush {& git push $args}
function doGitClean {& git reset --hard && git clean -df}

Set-Alias -Name gst -Value showGitStatus
New-Alias -Name gln -Value showGitLog
New-Alias -Name glhf -Value showGitLogPretty
New-Alias -Name gcom -Value doGitCheckoutMain
New-Alias -Name gcod -Value doGitCheckoutDev
New-Alias -Name gaa -Value doGitAddAll
New-Alias -Name gcwm -Value doGitCommitMessage
New-Alias -Name gca -Value doGitCommitAllMessage
New-Alias -Name gpu -Value doGitPush
New-Alias -Name nah -Value doGitClean
