# How to setup Ubuntu desktop

```bash
echo "don ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/don

sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y

sudo apt search nvidia-3
sudo apt install -y nvidia-384

sudo reboot

echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo apt update
sudo apt install -y google-chrome-stable

sudo apt install -y \
vim \
git \
zfsutils \
openvswitch-switch \
google-chrome-stable \
ssh \
byobu \
gnome-tweak-tool \
rdesktop \
tree \
ethtool \
vlc \
chrome-gnome-shell \
unattended-upgrades \
hexchat \
gimp \
sysstat \
qmmp \
youtube-dl \
bridge-utils \

sudo add-apt-repository ppa:hluk/copyq
sudo apt install -y copyq

sudo apt install -y libreoffice-writer

# network configuration
sudo vi /etc/netplan/01-network-manager-all.yaml

sudo systemctl status network
sudo systemctl status networkd-dispatcher.service
vi /etc/network/interfaces
sudo vi /etc/netplan/01-network-manager-all.yaml
sudo vi /etc/network/interfaces

# OVS and NICs configuration
sudo ovs-vsctl add-br origin
sudo ovs-vsctl add-port origin eno1
sudo ovs-vsctl show
sudo apt install ethtool
sudo vi /etc/network/interfaces
vi /etc/netplan/01-network-manager-all.yaml
sudo vi /etc/netplan/01-network-manager-all.yaml
vi interfaces
sudo ovs-vsctl show
sudo ovs-vsctl add-br origin enp5s0f0
sudo ovs-vsctl add-port origin enp5s0f0
sudo ovs-vsctl add-port origin enp5s0f1
sudo ovs-vsctl add-port origin enp5s0f2
sudo ovs-vsctl add-port origin enp5s0f3
sudo ovs-vsctl show


sudo brctl addif origin eno1
sudo brctl addif origin enp5s0f0
sudo brctl addif origin enp5s0f1
sudo brctl addif origin enp5s0f2
sudo brctl addif origin enp5s0f\3
sudo brctl addif origin enp5s0f3




cat /etc/network/interfaces
# interfaces(5) file used by ifup(8) and ifdown(8)
auto origin
iface origin inet static
    address 192.168.255.3/24
    gateway 192.168.255.1
    mtu 9000

auto eno1
iface eno1 inet manual
    mtu 9000

auto enp5s0f0
iface enp5s0f0 inet manual
    mtu 9000

auto enp5s0f1
iface enp5s0f1 inet manual
    mtu 9000

auto enp5s0f2
iface enp5s0f2 inet manual
    mtu 9000

auto enp5s0f3
iface enp5s0f3 inet manual
    mtu 9000


# DNS resolver configuration
vi /etc/resolv.conf
sudo vi /etc/resolv.conf
sudo apt update
sudo apt install dnsmasq
sudo vi /etc/resolv.conf
vi /etc/resolvconf/update-libc.d/avahi-daemon
sudo vi /etc/resolv.conf
sudo vi /etc/systemd/resolved.conf
sudo vi /etc/netplan/01-network-manager-all.yaml
sudo vi /etc/network/interfaces
vi /etc/resolv.conf
sudo vi /etc/systemd/resolved.conf
sudo vi /etc/resolv.conf
sudo vi /etc/systemd/resolved.conf
sudo systemctl stop systemd-resolved
sudo systemctl disable systemd-resolved
sudo vi /etc/systemd/resolved.conf
sudo vi /etc/resolv.conf
sudo apt install dnsmasq
vi /etc/dnsmasq.conf
sudo vi /etc/resolv.conf
sudo apt install net-tools
sudo vi /etc/resolv.conf
vi /etc/dnsmasq.conf
sudo vi /etc/dnsmasq.conf
sudo systemctl restart dnsmasq.service
sudo vi /etc/netplan/01-network-manager-all.yaml
sudo apt update
sudo systemctl status dnsmasq.service
sudo vi /etc/resolv.conf
vi ../run/systemd/resolve/stub-resolv.conf
locate resolv
locate resolv.conf
locate resolv | grep dnsmasq
sudo vi /etc/resolvconf/update.d/dnsmasq
sudo systemctl status dnsmasq.service
sudo systemctl start dnsmasq.service
sudo systemctl status dnsmasq.service
sudo vi /etc/resolv.conf
sudo systemctl stop dnsmasq.service
sudo systemctl start dnsmasq.service
sudo systemctl status dnsmasq.service
sudo vi /etc/network/interfaces
sudo vi /etc/dnsmasq.conf
sudo systemctl status NetworkManager.service
vi /etc/network/interfaces
sudo systemctl stop NetworkManager.service
sudo systemctl disable NetworkManager.service
sudo systemctl status NetworkManager.service
sudo systemctl stop NetworkManager.service
sudo systemctl disable NetworkManager.service
sudo systemctl status NetworkManager.service

sudo vi /etc/resolv.conf 
cat /etc/resolv.conf 
sudo vi /etc/resolv.conf 
cat /etc/resolv.conf 
cat /etc/resolv.conf 
cat /run/resolv/resolv.conf
ll /etc/resolv.conf 
ll /run/systemd/resolve/stub-resolv.conf
ll /etc/run/systemd/resolve/stub-resolv.conf
ls /run/systemd/resolve/stub-resolv.conf
sudo vi /etc/resolv.conf 
sudo vi /etc/resolv.conf 
cat /run/systemd/resolve/resolv.conf
sudo rm -rf /etc/resolv.conf 
sudo ln -sf /run/systemd/resolve/resolv.conf /etc/resolv.conf
cat /etc/resolv.conf 
ll /etc/resolv.conf 
cat /etc/resolv.conf 
ll /run/systemd/resolve/stub-resolv.conf
cat /run/systemd/resolve/stub-resolv.conf
ll /run/systemd/resolve/stub-resolv.conf
ll /etc/resolv.conf 
sudo rm -rf /etc/resolv.conf 
sudo ln -sf ../run/systemd/resolve/stub-resolv.conf /etc/resolv.conf
ll /etc/resolv.conf 
cat ../run/systemd/resolve/stub-resolv.conf
cat /run/systemd/resolve/stub-resolv.conf
sudo rm -rf /etc/resolv.conf 
sudo ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf
ll /run/systemd/resolve/stub-resolv.conf
cat /run/systemd/resolve/stub-resolv.conf
sudo rm -rf /etc/resolv.conf 
sudo ln -sf /run/systemd/resolve/resolv.conf /etc/resolv.conf

# in /run/systemd/resolve, there are two resolv.conf files generated by netplan.
# /run/systemd/resolve/stub-resolv.conf for systemd-resolved
# /run/systemd/resolve/resolv.conf as traditional default resolver which can be used with dnsmasq


# ZFS
sudo zfs list
cat /proc/partitions
sudo zpool import
sudo zpool import pssd
sudo zpool import praid
sudo zfs list
sudo zpool -h
sudo zpool destroy pssd
sudo zfs list
cat /proc/partitions
cat /proc/partitions
sudo zpool create -f -o ashift=12 pssd sde
sudo zpool list
sudo zfs create pssd/lxc
sudo zfs create pssd/kvm
sudo zfs set compression=lz4 pssd/lxc
sudo zfs set compression=lz4 pssd/kvm
sudo zfs list

# Libvirt/KVM
cat /proc/cpuinfo
sudo apt install -y virt-manager cpu-checker qemu qemu-kvm libvirt-bin
virsh net-destroy default
virsh net-undefine default

virsh
cat net.xml
<network>
  <name>origin</name>
  <forward mode='bridge'/>
  <bridge name='origin'/>
  <virtualport type='openvswitch'/>
</network>

vi /etc/network/interfaces
sudo vi /etc/network/interfaces
vi net.xml
virsh net-define net.xml
vi net.xml
virsh net-define net.xml
virsh

# Byobu
echo "set-option -g history-limit 100000" | tee -a ~/.byobu/.tmux.conf

# LXD
sudo apt install lxd lxd-client

sudo lxd init -h
apt install lxd lxd-client
sudo apt install lxd lxd-client
lxc storage create local_ssd zfs source=pssd/lxc
Storage pool local_ssd created


lxc image --verbose copy ubuntu:16.04 local: --alias ubuntu-16.04 --public --auto-update
lxc image --verbose copy ubuntu:18.04 local: --alias ubuntu-18.04 --public --auto-update
lxc image list
+--------------+--------------+--------+---------------------------------------------+--------+----------+-----------------------------+
|    ALIAS     | FINGERPRINT  | PUBLIC |                 DESCRIPTION                 |  ARCH  |   SIZE   |         UPLOAD DATE         |
+--------------+--------------+--------+---------------------------------------------+--------+----------+-----------------------------+
| ubuntu-16.04 | 4449aa491760 | yes    | ubuntu 16.04 LTS amd64 (release) (20181030) | x86_64 | 158.08MB | Nov 4, 2018 at 2:46pm (UTC) |
+--------------+--------------+--------+---------------------------------------------+--------+----------+-----------------------------+
| ubuntu-18.04 | 30b9f587eb6f | yes    | ubuntu 18.04 LTS amd64 (release) (20181029) | x86_64 | 174.43MB | Nov 4, 2018 at 2:49pm (UTC) |
+--------------+--------------+--------+---------------------------------------------+--------+----------+-----------------------------+

# rc.local
# https://www.linuxbabe.com/linux-server/how-to-enable-etcrc-local-with-systemd
cat /etc/systemd/system/rc-local.service
[Unit]
Description=/etc/rc.local Compatibility
ConditionPathExists=/etc/rc.local

[Service]
Type=forking
ExecStart=/etc/rc.local start
TimeoutSec=0
StandardOutput=tty
RemainAfterExit=yes
SysVStartPriority=99

[Install]
WantedBy=multi-user.target
sudo systemctl enable rc-local

sudo cat /etc/rc.local
#!/bin/bash

iptables -t nat -A POSTROUTING -o origin -j MASQUERADE

exit 0
sudo chmod +x /etc/rc.local
sudo systemctl start rc-local
sudo iptables -L -n -v -t nat

# ssh client
sudo vi /etc/ssh/ssh_config
...
...
StrictHostKeyChecking no
UserKnownHostsFile=/dev/null

ssh-keygen -t rsa


# default editor
sudo update-alternatives --config editor
There are 4 choices for the alternative editor (providing /usr/bin/editor).

  Selection    Path                Priority   Status
------------------------------------------------------------
* 0            /bin/nano            40        auto mode
  1            /bin/ed             -100       manual mode
  2            /bin/nano            40        manual mode
  3            /usr/bin/vim.basic   30        manual mode
  4            /usr/bin/vim.tiny    15        manual mode

Press <enter> to keep the current choice[*], or type selection number: 3
update-alternatives: using /usr/bin/vim.basic to provide /usr/bin/editor (editor) in manual mode

lxc profile show default 
config:
  boot.autostart: "true"
  boot.autostart.delay: "5"
  user.user-data: |
    #cloud-config
    manage_etc_hosts: true
    package_update: false
    package_upgrade: false
    apt:
      primary:
        - arches: [default]
          uri: http://kr.archive.ubuntu.com/ubuntu/
      security:
        - arches: [default]
          uri: http://kr.archive.ubuntu.com/ubuntu/
    users:
      - default
      - name: don
        gecos: don
        sudo: ALL=(ALL) NOPASSWD:ALL
        groups: users, admin
        shell: "/bin/bash"
        lock_passwd: true
        ssh_authorized_keys:
          - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDDXNiX7S+8irf+tDNTxY59kffDyeFPbMb8RWIYXlaC48/TYYF7MxrpfPPv9S3USqwuI4JwTYWneSBzzm/x511XvxD5LKJlVNVOueaZVn1VquES/qPtIM+dlPSs4saYgsbda33XuXcdAGU2KGVGNJTxVmlsPaVXfnCdM2+kXNfk45QmKbEdvyu116qtgjpgPJFF1UDnCQI5745t/VxWz0kuCqRQ/+LzNbdE7h4TKXKw/vPJjI7kbr3IzME0qjYlrmsnWfJNe/1z9b0kAG0vhA5p9Ged0qBg2f8PPjiB8WOZ9TOjo+lm44eaTCqwNy6o/J3ElIFY3ImGhf3GF9JXGUBv don@don-home
description: Default LXD profile
devices:
  eth0:
    nictype: bridged
    parent: origin
    type: nic
  root:
    path: /
    pool: local_ssd
    type: disk
name: default
used_by: []

cat /etc/network/interfaces
# interfaces(5) file used by ifup(8) and ifdown(8)
auto origin
iface origin inet static
    address 192.168.255.3/24
    gateway 192.168.255.1
    mtu 9000
    bridge_ports eno1
    bridge_stp off
    bridge_waitport 0
    bridge_fd 0

auto eno1
iface eno1 inet manual
    mtu 9000

auto enp5s0f0
iface enp5s0f0 inet manual
    mtu 9000

auto enp5s0f1
iface enp5s0f1 inet manual
    mtu 9000

auto enp5s0f2
iface enp5s0f2 inet manual
    mtu 9000

auto enp5s0f3
iface enp5s0f3 inet manual
    mtu 9000


lxc launch ubuntu-16.04 default1604
ssh ???
sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y

lxc launch ubuntu-18.04 default1804
ssh ???
sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y

lxc publish --verbose default1604 local: --alias default-16.04
lxc publish --verbose default1804 local: --alias default-18.04


lxc init default-18.04 -p default maas
lxc config edit maas
architecture: x86_64
config:
  raw.lxc: |-
    lxc.cgroup.devices.allow = c 10:237 rwm
    lxc.apparmor.profile = unconfined
    lxc.cgroup.devices.allow = b 7:* rwm
  security.privileged: "true"
  user.network-config: |-
    version: 1
    config:
      - type: physical
        name: eth0
        subnets:
          - type: static
            address: 192.168.255.2/24
            gateway: 192.168.255.1
            dns_nameservers:
              - 8.8.8.8
..........
..........
..........
devices:
  loop0:
    path: /dev/loop0
    type: unix-block
  loop1:
    path: /dev/loop1
    type: unix-block
  loop2:
    path: /dev/loop2
    type: unix-block
  loop3:
    path: /dev/loop3
    type: unix-block
  loop4:
    path: /dev/loop4
    type: unix-block
  loop5:
    path: /dev/loop5
    type: unix-block
  loop6:
    path: /dev/loop6
    type: unix-block
  loop7:
    path: /dev/loop7
    type: unix-block
ephemeral: false
profiles:
- default
stateful: false
description: ""

lxc start maas

ssh ???

sudo apt-add-repository -yu ppa:maas/stable
sudo apt install maas

sudo maas createadmin --username=don --email=don@origin.don
# http://192.168.255.2:5240/MAAS
```
