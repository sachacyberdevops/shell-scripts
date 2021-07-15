  
#!/bin/bash
# Update the list of packages
sudo apt-get update -y;
# Install pre-requisite packages.
sudo apt-get install -y wget apt-transport-https software-properties-common;
# Install Audit Daemon
sudo apt-get install auditd audispd-plugins -y;
# Add audit filter rules to capture successful process executions
sudo auditctl -a always,exit -F arch=b32 -S execve,execveat;
sudo auditctl -a always,exit -F arch=b64 -S execve,execveat;
sudo auditctl -w /bin/kmod -p x -k kernelmodules;
sudo auditctl -w /var/log/audit -p wxa -k audittampering;
sudo auditctl -w /etc/audit -p wxa -k audittampering;
sudo auditctl -w /etc/passwd -p wxa -k usergroup;
sudo auditctl -w /etc/group -p wxa -k usergroup;
sudo auditctl -w /etc/pam.d -p wxa -k pam;
# Command to confirm list of added audit filters
sudo auditctl -l;
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
IEX (IWR 'https://raw.githubusercontent.com/redcanaryco/invoke-atomicredteam/master/install-atomicredteam.ps1' -UseBasicParsing);
Install-AtomicRedTeam -getAtomics;
Invoke-AtomicTest
