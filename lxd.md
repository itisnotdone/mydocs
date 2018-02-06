# LXD

## Commands
```bash
lxc remote list

lxc image list images:
lxc image list ubuntu:
lxc image list ubuntu-daily:
lxc image alias list ubuntu-daily:

# setup as a remote
lxc config set core.trust_password $PASSWORD
lxc config set core.https_address 0.0.0.0:8443

# copy images from remote
lxc image --debug --verbose copy ubuntu-daily:16.04 local: --alias ubuntu-16.04 --public --auto-update
lxc image --debug --verbose copy images:centos/7/amd64 local: --alias centos7 --public --auto-update

# add a remote
lxc remote add $HOSTNAME $FQDN --accept-certificate
lxc remote add lxd01 lxd01.aregion.org --accept-certificate
```

## Initialize a CentOS image
```bash
lxc exec CONTAINER_NAME bash
rpm -ivh http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum update -y
yum install -y net-tools openssh-lxc image list ubuntu-daily:server openssh-clients vim tree cloud-init


exit
cp -av $UBUNTU_CONTAINER/templates/cloud-init-* $CENTOS_CONTAINER/templates/
```
