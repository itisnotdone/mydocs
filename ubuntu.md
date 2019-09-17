# Ubuntu

## Network
- Netplan
  - https://netplan.io/
  - https://github.com/openvswitch/ovs/blob/master/debian/openvswitch-switch.README.Debian

## Graphic Card
```bash
sudo apt search nvidia-3 # Search for latest driver
sudo apt install -y vim nvidia-384
```

## Clipboard manager
- You can make it auto-start when boot
- Enable VI like control to select items
```bash
sudo apt install -y copyq


# When using CLI
copyq tab clipboard add "blahblahblah"
copyq tab clipboard read 0
# the tab 'cliboard' is default tab used with GUI

```

## A simple music player
sudo apt install -y qmmp


## CD burning suite
https://brasero.en.uptodown.com/ubuntu

## Bootable USB creator
- mkusb
  - https://help.ubuntu.com/community/mkusb

## Application selection to execute
```bash
# for text file editor
sudo update-alternatives --config editor
```
## How to cut off video
ffmpeg -ss 00:00:00 -i test.mkv -codec copy -t 00:20:00 out.mkv

## How to deal with multiple DNS servers
```bash
cat /etc/network/interfaces

auto lo
iface lo inet loopback
  dns-domain default.don

server=/default.don/172.31.0.2
server=/second.don/172.31.1.2
server=8.8.8.8

sudo systemctl restart dnsmasq.service
```
## Gnome custom shortcuts
Key / Command
- ctrl + g / google-chrome

## Gnome Workspace Grid
- On firefox, add 'Workspace Grid' extension.
(Chrome is not supported for this)
- Open 'Tweaks' -> 'Extensions' and configure the grid.

## mpv player
echo "volume=30" > ~/.config/mpv/mpv.conf

## How to zero a disk
sudo dd if=/dev/zero of=/dev/sdb status=progress

## How to simpely check storage performance
while true; do dd if=/dev/zero of=test.txt status=progress oflag=direct bs=1G; done
