
- 

```bash
git_user=
git_email=
hostname=
ip=
user=


# package update and upgrade
sudo apt update && sudo apt full-upgrade -y

sudo apt install -y lxd-client libvirt-dev libvirt-bin git tree

sudo reboot

# vi
# https://github.com/itisnotdone/mydotfile.git

# git config
git config --global user.email "donoldfashioned@gmail.com"                                                                                                                                                                                                                              
git config --global user.name "Don Draper"

# chefdk
if [ ! -f /etc/apt/sources.list.d/chef-stable.list ]; then
sudo apt-get install apt-transport-https
wget -qO - https://packages.chef.io/chef.asc | sudo apt-key add -
echo "deb [arch=amd64] http://packages.chef.io/repos/apt/stable xenial main" | sudo tee /etc/apt/sources.list.d/chef-stable.list
sudo apt update
fi

sudo apt install -y chefdk
# or sudo apt install -y chefdk=VERSION
chef verify
echo '' | tee -a ~/.bashrc
echo 'eval "$(chef shell-init bash)"' | tee -a ~/.bashrc
# logout and in


# destroy default network for libvirt
virsh net-destroy default
virsh net-undefine default

# https://github.com/itisnotdone/kitchen-gogetkitchen
export PKG_CONFIG_PATH=/usr/lib/x86_64-linux-gnu/pkgconfig
kitchen init -D kitchen-gogetkitchen -P chef_zero

rm -rf .kitchen.yml chefignore test/integration/default
cd /home/ubuntu/.chefdk/gem/ruby/*/gems

for APP in maas-client gogetit kitchen-gogetkitchen; do \
git clone https://github.com/itisnotdone/$APP.git; \
rm -rf $APP-*; \
ln -s $PWD/$APP $PWD/$APP-`gem list | grep $APP | awk '{print $2}' | tr -d '()'`; \
echo "[user]" >> $APP/.git/config; \
echo "  user = $git_user" >> $APP/.git/config; \
echo "  mail = $git_email" >> $APP/.git/config; \
done

# clone cookbooks you are working on

# copy .chef.tar.gz under the chef-repo

knife ssl check

# ssh configuration
echo "StrictHostKeyChecking no" | sudo tee -a /etc/ssh/ssh_config
echo "UserKnownHostsFile=/dev/null" | sudo tee -a /etc/ssh/ssh_config

# add lxc remote
lxc remote add --accept-certificate $hostname https://$ip:8443
# Enter password you set before
# https://github.com/itisnotdone/mydocs/blob/master/how_to_setup_ubuntu_desktop.md

# enable to run virsh command remotly
ssh-keygen -t rsa
ssh-copy-id $user@$ip
# Enter $user password and make sure following command works
ssh $user@$ip id

gogetit list
Please define default configuration for GoGetIt at ~/.gogetit/gogetit.yml.


```