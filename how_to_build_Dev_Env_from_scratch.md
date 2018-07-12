# How to build development environment from scratch
```
Desktop
|
|---LXD
|   |---chef-workstation
|   |---maas
|   |---nexus
|   |---chef-server
|
|---Libvirt/KVM
|---Kubernetes
```



- Install Ubuntu on the desktop
- Run init_desktop cookbook to initialize your desktop
```bash
go get -u github.com/itisnotdone/easeovs

sudo easeovs create --config ~/go/src/github.com/itisnotdone/easeovs/template/single_region.yml

easeovs generate --config ~/go/src/github.com/itisnotdone/easeovs/template/single_region.yml --host-id 2

gogetit create --no-maas -f network_default.yml --maas-on-lxc maas
```
