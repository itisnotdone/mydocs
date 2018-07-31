```bash
# upgrade packages and reboot
sudo apt update && sudo apt full-upgrade -y && sudo apt reboot

# install latest nvidia driver and other things necessary, and reboot
sudo apt install -y `sudo apt search nvidia- | egrep '^nvidia-[34]' | egrep -v '\-dev' | tail -n 1 | awk -F '/' '{print $1}'`
sudo apt install -y git whois zfsutils-linux vim byobu
sudo apt autoremove -y
sudo reboot

# Download chefdk and install
# https://downloads.chef.io/chefdk
sudo dpkg -i chefdk*

mkdir development
cd development
git clone https://github.com/itisnotdone/tournant.git

cd tournant
mkdir cookbooks
cd cookbooks
git clone https://github.com/itisnotdone/init_desktop.git
# change attributes and recipes to run as necessary






# to move unity launcher to the bottom
gsettings set com.canonical.Unity.Launcher launcher-position Bottom

# run dconf-editor
# org['gnome']['desktop']['wm']['keybindings']['switch-input-source'] = 'Hangul'
# org['gnome']['desktop']['wm']['keybindings']['switch-input-source-backward'] = 'Hangul'
```
