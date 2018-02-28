# How to setup workstation

```sh
# package update and upgrade
sudo apt update && sudo apt full-upgrade -y && \
sudo apt install -y lxd-client libvirt-dev libvirt-bin git tree byobu && \
sudo reboot
!ssh

# byobu setting
mkdir ~/.byobu && \
echo "set-option -g history-limit 100000" | tee -a ~/.byobu/.tmux.conf

# vi
# https://github.com/itisnotdone/mydotfile.git

EMAIL="donoldfashioned@gmail.com"
NAME="Don Draper"

# git config
git config --global user.email $EMAIL
git config --global user.name $NAME
git config --list | egrep 'email|name'

# chefdk
if [ ! -f /etc/apt/sources.list.d/chef-stable.list ]; then
sudo apt-get install apt-transport-https
wget -qO - https://packages.chef.io/chef.asc | sudo apt-key add -
echo "deb [arch=amd64] http://packages.chef.io/repos/apt/stable xenial main" | sudo tee /etc/apt/sources.list.d/chef-stable.list
sudo apt update
fi

# https://github.com/chef/chef-dk/pull/1316#issuecomment-313738278
sudo apt install -y chefdk
# to make embedded chef refer your custom repo

chef gem install knife-zero

# https://github.com/chef/chef-dk
echo '' | tee -a ~/.bashrc
echo 'eval "$(chef shell-init bash)"' | tee -a ~/.bashrc
exit
!ssh
# logout and in

# destroy default network for libvirt
# virsh net-destroy default
virsh net-undefine default

# https://github.com/itisnotdone/kitchen-gogetkitchen
export PKG_CONFIG_PATH=/usr/lib/x86_64-linux-gnu/pkgconfig; \
mkdir temp; cd temp; kitchen init -D kitchen-gogetkitchen -P chef_zero; \
cd -; rm -r temp;
# This will install necessary gem packges depending on the driver

gogetit list

# about activesupport dependency
# change following lines
/home/ubuntu/.chefdk/gem/ruby/2.4.0/gems/hyperkit-1.1.0/hyperkit.gemspec | grep activesupport
/home/ubuntu/.chefdk/gem/ruby/2.4.0/specifications/hyperkit-1.1.0.gemspec | grep activesupport
vi
:%s/4.2.6/5.1.4/gc
# go to a project
kitchen status

# to transfer files faster
chef gem install kitchen-sync

# ssh configuration
echo "StrictHostKeyChecking no" | sudo tee -a /etc/ssh/ssh_config
echo "UserKnownHostsFile=/dev/null" | sudo tee -a /etc/ssh/ssh_config

# add lxc remote
lxc remote add --accept-certificate $hostname https://$ip:8443
# Enter password you set before
# https://github.com/itisnotdone/mydocs/blob/master/how_to_setup_ubuntu_desktop.md

# enable to run virsh command remotly
ssh-keygen -t rsa
ssh-copy-id $user@$ip # Enter $user password
# make sure following command works
ssh $user@$ip id
virsh -c qemu+ssh://$user@$ip/system list


chef gem install knife-zero
# to set default editor
echo >> .chef/knife.rb
echo "knife[:editor] = 'vi'" >> .chef/knife.rb
echo "knife[:vault_mode] = 'client'" >> .chef/knife.rb
echo "knife[:vault_admins] = [ 'your_admin_account_name' ]" >> .chef/knife.rb
knife ssl check

```
