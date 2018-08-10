```bash
# upgrade packages and reboot
sudo apt update && sudo apt full-upgrade -y && sudo apt reboot

# install latest nvidia driver and other things necessary, and reboot
sudo apt install -y `sudo apt search nvidia- | egrep '^nvidia-[34]' | egrep -v '\-dev' | tail -n 1 | awk -F '/' '{print $1}'`
sudo apt install -y git whois zfsutils-linux vim byobu
sudo apt autoremove -y
sudo reboot

# Download chef and chefdk
# https://downloads.chef.io/chefdk#ubuntu
# https://downloads.chef.io/chef#ubuntu

# install chefdk(Do not need to install client since dk contains client as well)
sudo dpkg -i chefdk*

mkdir development
cd development
git clone https://github.com/itisnotdone/tournant.git

cd tournant
mkdir cookbooks
cd cookbooks
git clone https://github.com/itisnotdone/init_desktop.git
# change attributes and recipes to run as necessary

# run the cookbook and reboot the PC
#########################################################################################

# initialize development environment
bash init.sh provision_ruby_projects
bash init.sh provision_chef_projects
bash init.sh propagate_shared_dirs
bash init.sh link_for_zero
bash init.sh provision_sessions

# create virtual networks, configurations and definitions
sudo easeovs create --config go/src/github.com/itisnotdone/easeovs/template/single_region.yml
easeovs generate --config ~/go/src/github.com/itisnotdone/easeovs/template/single_region.yml --host-id 2

# create a container to be a MAAS server
gogetit create def-maas --no-maas --maas-on-lxc -f cloudinit_net_default.yml

# to move unity launcher to the bottom
gsettings set com.canonical.Unity.Launcher launcher-position Bottom

# run dconf-editor
# org['gnome']['desktop']['wm']['keybindings']['switch-input-source'] = 'Hangul'
# org['gnome']['desktop']['wm']['keybindings']['switch-input-source-backward'] = 'Hangul'
```
