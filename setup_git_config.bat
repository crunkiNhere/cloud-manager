@echo off
echo Setting up Git global configuration for Windows 11...

:: Set user information
git config --global user.name "Jason Neukirchner"
git config --global user.email "jneukirchner@hotmail.com"

:: Set default editor to VS Code
git config --global core.editor "code --wait"

:: Set default branch name to main
git config --global init.defaultBranch main

:: Configure line endings for Windows
git config --global core.autocrlf true
git config --global core.safecrlf true

:: Enable credential helper for Windows
git config --global credential.helper manager

:: Set up some useful aliases
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.unstage "reset HEAD --"
git config --global alias.force-push "push --force-with-lease"
git config --global alias.force-pull "pull --force"
git config --global alias.force-fetch "fetch --force"
git config --global alias.force-checkout "checkout --force"
git config --global alias.force-reset "reset --hard"

:: Force options and safety configurations
git config --global push.default current
git config --global push.autoSetupRemote true
git config --global fetch.prune true
git config --global fetch.pruneTags true
git config --global rebase.autoStash true
git config --global pull.rebase false

:: Enable color output
git config --global color.ui true

:: Set up Windows-specific defaults
git config --global core.ignorecase true
git config --global core.quotepath false
git config --global core.symlinks false
git config --global core.fscache true
git config --global http.sslbackend schannel

:: Safety features
git config --global merge.ff false
git config --global merge.commit no
git config --global merge.branchdesc true
git config --global merge.log true
git config --global merge.verifySignatures false

:: Force push protection
git config --global receive.denyNonFastForwards true
git config --global receive.denyDeletes true

:: Force options for all operations
git config --global pull.force true
git config --global fetch.force true
git config --global checkout.force true
git config --global reset.force true
git config --global clean.force true
git config --global gc.force true
git config --global prune.force true

echo Git configuration complete!
echo Current configuration:
git config --list
pause

:: Enable WSL and Virtual Machine Platform
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart

echo WSL and Virtual Machine Platform enabled. Please restart your computer.
pause