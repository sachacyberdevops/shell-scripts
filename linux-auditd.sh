#!/bin/bash

sudo -i;
sudo apt install -y auditd;
sudo curl https://raw.githubusercontent.com/DFW1N/ansible-tower/main/credentials -o mitre_attack.rules;
touch /etc/audit/rules.d/mitre_attack.rules;
