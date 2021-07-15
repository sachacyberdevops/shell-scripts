#!/bin/bash

git clone https://github.com/DFW1N/shell-scripts.git;
ch shell-scripts/linux-scripts/NXlog;
sudo dpkg -i nxlog-ce_2.11.2190_ubuntu_xenial_amd64.deb
sudo apt-get -f install -y;
