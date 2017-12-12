# LXD

## Initialize a CentOS image
```bash
lxc exec CONTAINER_NAME bash
rpm -ivh http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum update -y
yum install -y net-tools openssh-server openssh-clients vim tree cloud-init


exit
cp -av $UBUNTU_CONTAINER/templates/cloud-init-* $CENTOS_CONTAINER/templates/
```
