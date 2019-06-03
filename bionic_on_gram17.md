# Bionic on LG Gram 17

```bash
cat /etc/lsb-release 
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=19.04
DISTRIB_CODENAME=disco
DISTRIB_DESCRIPTION="Ubuntu 19.04"

uname -r
5.0.0-13-generic

sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y

sudo apt install -y net-tools ssh vim byobu git tree qmmp zfsutils-linux

echo "don ALL = (root) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/don && sudo chmod 0440 /etc/sudoers.d/don

sudo update-alternatives --config editor /usr/bin/vim.basic

cat /etc/default/grub | grep GRUB_CMDLINE_LINUX_DEFAULT
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash acpi=strict"

# is 'acpi=strict' best option?

sudo update-grub

## when you reboot the laptop, it's not going to boot correctly.
## shutting down and then powering on are the working option at this moment.

sudo shutdown -h now

# power on

cat /proc/cmdline 
BOOT_IMAGE=/boot/vmlinuz-5.0.0-13-generic root=UUID=69a25ad8-bd99-47ea-88db-f812374fe085 ro quiet splash acpi=strict vt.handoff=1


# zfs
sudo zpool create -f -o ashift=12 data sdb
sudo zpool list
sudo zfs create data/lxc
sudo zfs create data/kvm
sudo zfs create data/work
sudo zfs set compression=lz4 data/lxc
sudo zfs set compression=lz4 data/kvm
sudo zfs set compression=lz4 data/work

# LXD

sudo snap install lxd

sudo lxd init

# Add user to lxd group

sudo reboot

lxc list

lxc storage create data zfs source=data/lxc


```
# Reference
- https://www.linuxquestions.org/questions/linux-kernel-70/ubuntu-18-04-acpi-errors-on-boot-on-dell-inspiron-15-5000-series-4175641092/#post5931616
