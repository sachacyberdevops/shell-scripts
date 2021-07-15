  
#!/bin/bash
# Update the list of packages
sudo apt-get update -y;
# Install pre-requisite packages.
sudo apt-get install -y wget apt-transport-https software-properties-common;
# Download the Microsoft repository GPG keys
wget -q https://packages.microsoft.com/config/ubuntu/16.04/packages-microsoft-prod.deb;
# Register the Microsoft repository GPG keys
sudo dpkg -i packages-microsoft-prod.deb;
# Update the list of packages after we added packages.microsoft.com
sudo apt-get update -y;
# Install PowerShell
sudo apt-get install -y powershell;
# Start PowerShell
pwsh;
# Sleep for 3 seconds
sleep 3;
IEX (IWR 'https://raw.githubusercontent.com/redcanaryco/invoke-atomicredteam/master/install-atomicredteam.ps1' -UseBasicParsing);
Install-AtomicRedTeam -getAtomics;
Invoke-AtomicTest
