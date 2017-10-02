# How to setup Ubuntu desktop
- Update and upgrade packages
- language support
- multiple workspace
- appearence
- google chrome
- sudoers
- terminal
- vi

```bash
sudo apt update && sudo apt full-upgrade -y

# Google Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key -y add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt install -y google-chrome-stable
```
