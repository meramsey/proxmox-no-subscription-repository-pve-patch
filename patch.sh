#!/usr/bin/env bash

mkdir -p /usr/share/pve-patch/{images,scripts}
echo "- patch `pveversion`..."
echo "- download and copy files..."
# We want to overwrite so updates work seamlessly if script updated.
wget -O /usr/share/pve-patch/scripts/90pvepatch https://gitlab.com/mikeramsey/proxmox-no-subscription-repository-pve-patch/-/raw/master/scripts/90pvepatch
wget -O /usr/share/pve-patch/scripts/apply.sh https://gitlab.com/mikeramsey/proxmox-no-subscription-repository-pve-patch/-/raw/master/scripts/apply.sh

# cd /usr/share/pve-patch/images/ && wget -nc https://gitlab.com/mikeramsey/proxmox-no-subscription-repository-pve-patch/-/raw/master/images/{favicon.ico,logo-128.png,proxmox_logo.png}
chmod -R a+x /usr/share/pve-patch/scripts
cp -f /usr/share/pve-patch/scripts/90pvepatch /etc/apt/apt.conf.d/90pvepatch
bash /usr/share/pve-patch/scripts/apply.sh

# pvedarkdiscord theme: courtesy of https://github.com/Weilbyte/PVEDiscordDark
bash <(curl -s https://raw.githubusercontent.com/Weilbyte/PVEDiscordDark/master/PVEDiscordDark.sh ) install
echo "- done!"
