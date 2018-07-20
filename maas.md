# MAAS
## CentOS image
### Configure /etc/yum.repos.d/*.repo
```sh
sed -i '/^mirrorlist=.*/d' /etc/yum.repos.d/*.repo
sed -i 's/^#\(baseurl=.*\)/\1/g' /etc/yum.repos.d/*.repo
sed -i 's/mirror.centos.org\/centos/centos.mirror.cdnetworks.com/g' /etc/yum.repos.d/CentOS-*.repo
sed -i 's/download.fedoraproject.org\/pub/ftp.jaist.ac.jp\/pub\/Linux\/Fedora/g' /etc/yum.repos.d/epel*.repo
mv -v /etc/yum.repos.d/CentOS-Media.repo /etc/yum.repos.d/CentOS-Media.repo.bak
```

### Configure necessary packages
```sh
yum install -y tree vim mlocate psmisc bind-utils sysstat telnet 
```

### To debug 'maas' command
- `maas` command uses python3
  - if you want to debug with `ptpython` you need to `apt install python3-pip` to install `ptpython`
- '/usr/lib/python3/dist-packages/maascli/api.py'
  - the module that deals with http request and response

### To debug MAAS server
- /usr/lib/python3/dist-packages/maasserver/djangosettings/settings.py
  - Change `DEBUG = False` to `DEBUG = True`

## curtinator
`curtinator` script invokes `virbr0` so either change the script or do not delete the bridge
```bash
sudo apt install -y qemu-kvm libvirt-bin virt-viewer genisoimage libguestfs-tools gettext-base

sudo reboot

sudo apt install -y bzr
bzr branch lp:curtinator
cd curtinator
wget http://archive.ubuntu.com/ubuntu-cd/18.04/ubuntu-18.04-desktop-amd64.iso
sudo bash -x ./scripts/curtinator ubuntu-18.04-desktop-amd64.iso
```





## References
- curtin
  - https://launchpad.net/curtinator
  - https://bazaar.launchpad.net/~roadmr/curtinator/trunk/view/head:/README
