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
## How to create a custom image
```bash
lxc image delete $PREVIOUS_IMAGE

# create a clean container with your favorite public image
gogetit create default-image -a ubuntu-16.04

ssh ubuntu@default-image

sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y && sudo apt install -y tree

# install chef client
wget -qO - https://packages.chef.io/chef.asc | sudo apt-key add -
echo "deb https://nexus.aregion.org/repository/chef/repos/apt/stable xenial main" | sudo tee /etc/apt/sources.list.d/chef-stable.list
sudo apt update && sudo apt install -y chef

# https://bugs.launchpad.net/ubuntu/+source/apparmor/+bug/1575779/comments/12
# hostnamectl matters when bootstrapping a chef node.
sudo EDITOR=vi systemctl edit systemd-hostnamed.service

# put following lines
[Service]
PrivateNetwork=no
# and save it

sudo systemctl daemon-reload && systemctl restart systemd-hostnamed.service
time hostnamectl

# for trusted ca certificates
EMBEDDED_RUBY_CA_CERTS=$(sudo /opt/chef/embedded/bin/ruby -ropenssl -e 'puts OpenSSL::X509::DEFAULT_CERT_FILE')
sudo mv -v $EMBEDDED_RUBY_CA_CERTS "$EMBEDDED_RUBY_CA_CERTS"_bak
sudo ln -s /etc/ssl/certs/ca-certificates.crt $EMBEDDED_RUBY_CA_CERTS
```








