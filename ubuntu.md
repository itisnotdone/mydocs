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
