# Install RVM.
```bash
# https://rvm.io/rvm/install
echo progress-bar >> ~/.curlrc && curl -sSL https://get.rvm.io | bash

# It depends on your development environment. See following thread if it does not work.
# https://askubuntu.com/questions/121073/why-bash-profile-is-not-getting-sourced-when-opening-a-terminal
source ~/.bash_profile

# Download source.
git clone https://github.com/itisnotdone/$PROJECT_NAME.git

# This should install and create the ruby version and gemset specified at .ruby-version and .ruby-gemset.
cd $PROJECT_NAME

bundle
```
