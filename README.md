# pve-patch

Removes subscription dialogs, replaces enterprise repository with non-subscription repository and replaces branding. Tested on PVE 5.

Supports both Proxmox 5.x and Proxmox 6.x

## Note

Use at your own risk! Read the script before you run it. 

## Install

1. Connect to node via SSH
2. Run

```bash
# if root
wget -qO - https://gitlab.com/mikeramsey/proxmox-no-subscription-repository-pve-patch/-/raw/master/patch.sh | bash

# if non-root
wget -qO - https://gitlab.com/mikeramsey/proxmox-no-subscription-repository-pve-patch/-/raw/master/patch.sh | sudo bash
```

## Update

```
apt-get update && apt-get dist-upgrade
```

## Restore

Enterprise repository

```
mv /etc/apt/sources.list.d/pve-enterprise.list~ /etc/apt/sources.list.d/pve-enterprise.list
```

Branding

```
cp -f /usr/share/pve-manager/images/favicon.ico~ \
/usr/share/pve-patch/images/favicon.ico && \
cp -f /usr/share/pve-manager/images/logo-128.png~ \
/usr/share/pve-patch/images/logo-128.png && \
cp -f /usr/share/pve-manager/images/proxmox_logo.png~ \
/usr/share/pve-patch/images/proxmox_logo.png && \
/usr/share/pve-patch/scripts/apply.sh
```
