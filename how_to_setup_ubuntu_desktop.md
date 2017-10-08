# How to setup Ubuntu desktop
- vi


```bash
# sudoers
echo "don ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/don

# initial upgrade
sudo apt update && sudo apt full-upgrade -y

# Update and upgrade packages
sudo apt -y install `check-language-support`
im-config -n fcitx
im-config -m
update-locale \
  LANG="en_US.UTF-8" \
  LC_NUMERIC="en_US.UTF-8" \
  LC_TIME="en_US.UTF-8" \
  LC_MONETARY="en_US.UTF-8" \
  LC_PAPER="en_US.UTF-8" \
  LC_NAME="en_US.UTF-8" \
  LC_ADDRESS="en_US.UTF-8" \
  LC_TELEPHONE="en_US.UTF-8" \
  LC_MEASUREMENT="en_US.UTF-8" \
  LC_IDENTIFICATION="en_US.UTF-8"

# essential packages
sudo apt install -y byobu \
git \
vim \
tree \
zfsutils-linux \
lxd \
bridge-utils \
openvswitch-switch

# git config for user and email
git config --global user.name "Don Draper"
git config --global user.email "donoldfashioned@gmail.com"

# Google Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | \
  sudo apt-key add -
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | \
  sudo tee /etc/apt/sources.list.d/google.list
sudo apt update
sudo apt install -y google-chrome-stable

# after watching with `dconf watch /`
# appearence for things
dconf write /org/compiz/profiles/unity/plugins/unityshell/launcher-hide-mode 1
dconf write /org/compiz/profiles/unity/plugins/core/hsize 2
dconf write /org/compiz/profiles/unity/plugins/core/vsize 2

# for gnome terminal
profile="$(dconf list /org/gnome/terminal/legacy/profiles:/ | sed 's./..')"
dconf write /org/gnome/terminal/legacy/profiles:/$profile/use-transparent-background true
dconf write /org/gnome/terminal/legacy/profiles:/$profile/background-transparency-percent 20

# ZFS
cat /proc/partitions
sudo fdisk /dev/sd?

sudo zpool create -f -o ashift=12 p1 sd??
sudo zpool status
sudo zfs create p1/lxc
sudo zfs create p1/kvm
sudo zfs set compression=lz4 p1/lxc
sudo zfs set compression=lz4 p1/kvm
sudo zfs list

# LXD
sudo lxd init \
  --auto \
  --network-address 0.0.0.0 \
  --network-port 8443 \
  --storage-backend zfs \
  --storage-pool p1/lxc

lxc config set core.trust_password $PASSWORD
lxc config show
config:
  core.https_address: 0.0.0.0:8443
  core.trust_password: true
  storage.zfs_pool_name: p1/lxc

lxc image \
  --debug \
  --verbose \
  copy ubuntu-daily:16.04 local: --alias ubuntu-16.04 --public --auto-update

# OVS
sudo ovs-vsctl add-br bra
for VID in 11 12 13 14 15; do sudo ovs-vsctl add-br bra-$VID bra $VID; done
sudo ovs-vsctl show

```






