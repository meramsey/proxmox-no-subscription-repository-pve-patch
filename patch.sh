#!/usr/bin/env bash

mkdir -p /usr/share/pve-patch/{images,scripts}
echo "- patch `pveversion`..."
echo "- download and copy files..."
cd /usr/share/pve-patch/scripts/
wget -N https://gitlab.com/mikeramsey/proxmox-no-subscription-repository-pve-patch/-/raw/master/scripts/{90pvepatch,apply.sh}
cd /usr/share/pve-patch/images/
wget -nc https://gitlab.com/mikeramsey/proxmox-no-subscription-repository-pve-patch/-/raw/master/images/{favicon.ico,logo-128.png,proxmox_logo.png}
chmod -R a+x /usr/share/pve-patch/scripts
cp -f /usr/share/pve-patch/scripts/90pvepatch /etc/apt/apt.conf.d/90pvepatch
/usr/share/pve-patch/scripts/apply.sh
echo "- done!"
