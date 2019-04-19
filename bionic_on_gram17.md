# Bionic on LG Gram 17

```bash
cat /etc/default/grub | grep GRUB_CMDLINE_LINUX_DEFAULT
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash acpi=strict"

sudo update-grub

sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y

sudo apt install -y net-tools ssh vim byobu


```
