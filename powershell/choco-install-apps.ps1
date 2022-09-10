
## make sure to update your system if you had a fresh OS installed
## To fix "cannot be loaded because running scripts is disabled on this system" (run: 'get-executionpolicy' returns: Restricted) -->
## set-executionpolicy remotesigned

# Run following to bypass "not digitally signed" issue (fixes per session only)
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

# microsoft-windows-terminal, mongodb install failed due to some issues

$Packages = @('brave','googlechrome','mysql.workbench','mysql','mysql-cli','mongodb','mongodb-shell','mongodb-compass','pgadmin4','postgresql','wsl2','discord.install','microsoft-windows-terminal','postman',
'vscode','docker-desktop','docker-cli','git.install','gimp','kdenlive','gh','nvm','nodejs','vlc','rust','golang','visualstudio-installer','steam-client','figma','obs-studio.install','qbittorrent','7zip',
'warp','clementine','libreoffice-fresh','yarn','virtualbox')

$chocoIsInstalled = Test-Path -Path "$env:ProgramData\Chocolatey" # Get-Command choco.exe -ErrorAction SilentlyContinue

$chocoList = choco list -lai
 
if(!$chocoIsInstalled) {
  write-host "Chocolatey not found! Installing Chocolatey ..."

  Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))      
}
  
foreach ($PackageName in $Packages)
{
  if(!!($chocoList | Select-String -Pattern $PackageName -SimpleMatch)) {
    write-host "Package $PackageName is already installed! Skipping installation..."
  } else {
    write-host "Installation for package $PackageName started..."

    choco install $PackageName -y
  }
}

write-host "All installations completed!"
