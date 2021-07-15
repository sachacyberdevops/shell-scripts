#!/bin/bash

# Going into Root
sudo -i;
# Installing auditd
sudo apt install -y auditd;
# Pulling mitre_attack.rules from a Github Repo
sudo curl https://raw.githubusercontent.com/DFW1N/shell-scripts/main/audit-attack.rules -o /etc/audit/rules.d/mitre_attack.rules;
# Restarting auditd service
service auditd restart;
# Please run these commands and find the adminus+ process
# ps aux | grep pam 
# lsof -p 8015 | grep pam_
