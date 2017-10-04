# How to setup Ubuntu desktop
- Update and upgrade packages
- language support
- Unity Tweak tool
- multiple workspace
- appearence
- essential packages
- google chrome
- sudoers
- terminal
- vi
- git config for user and email
- zfs


```bash
sudo apt update && sudo apt full-upgrade -y

# essential packages
sudo apt install -y byobu \
git \
vim \
tree \
zfsutils-linux \
lxd \
bridge-utils \
openvswitch-switch


# Google Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key -y add -
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google.list
sudo apt install -y google-chrome-stable

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

# sudoers
echo "don ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/don

# LXD
sudo lxd init --auto --network-address 0.0.0.0 --network-port 8443 --storage-backend zfs --storage-pool p1/lxc

lxc config set core.trust_password $PASSWORD
lxc config show
config:
  core.https_address: 0.0.0.0:8443
  core.trust_password: true
  storage.zfs_pool_name: p1/lxc

lxc image --debug --verbose copy ubuntu-daily:16.04 local: --alias ubuntu-16.04 --public --auto-update

# OVS
sudo ovs-vsctl add-br bra
for VID in 11 12 13 14 15; do sudo ovs-vsctl add-br bra-$VID bra $VID; done
sudo ovs-vsctl show

```











