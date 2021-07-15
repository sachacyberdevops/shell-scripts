#!/bin/bash

sudo -i;
sudo apt install -y auditd;
touch /etc/audit/rules.d/mitre_attack.rules;
