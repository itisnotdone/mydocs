## How to install chef-server
```bash
sudo apt-get install apt-transport-https
wget -qO - https://packages.chef.io/chef.asc | sudo apt-key add -
echo "deb [arch=amd64] http://repo/chef/repos/apt/stable xenial main" | sudo tee /etc/apt/sources.list.d/chef-stable.list
sudo apt update

sudo apt install -y chef-server-core
sudo chef-server-ctl reconfigure

sudo apt install -y chef-manage
sudo chef-server-ctl reconfigure
sudo chef-manage-ctl reconfigure --accept-license

sudo apt install -y opscode-push-jobs-server
sudo chef-server-ctl reconfigure
sudo opscode-push-jobs-server-ctl reconfigure

sudo apt install -y opscode-reporting
sudo chef-server-ctl reconfigure
sudo opscode-reporting-ctl reconfigure --accept-license

```


## How to use knife-solo

```sh
gogetit create solo01

knife solo init $somewhere

cd $somewhere

vi Berksfile
# Add cookbooks to download via berkshelf

knife solo prepare ubuntu@solo01

vi nodes/solo01.json
# Add runlist

knife solo cook ubuntu@solo01
```

## 'chef-client' with local mode
```bash
## time to work on zero!!
chef generate app demoApp
cd demoApp
chef-client -z
knife node list -z
knife node show -z $HOSTNAME

cd cookbooks/demoApp
# edit metadata.rb and recipes/default.rb
knife node run_list add -z $HOSTNAME demoApp
sudo chef-client -z
```
## 'chef-client', 'local mode' and 'policy'
```bash
# to work with policy
# export artifacts as tar.gz
COOKBOOK_NAME=cook01
cd $COOKBOOK_NAME
chef export -a ../$COOKBOOK_NAME.tar.gz
scp ../$COOKBOOK_NAME.tar.gz $SOMEWHERE_YOU_WANT

# go to the node to run in local mode
mkdir $COOKBOOK_NAME
# get the tar.gz artifacts by copying
tar zxvf $COOKBOOK_NAME.tar.gz -C $COOKBOOK_NAME
cd $COOKBOOK_NAME
# follow instructions here
# http://knife-zero.github.io/tips/with_policyfile/
chef-client -z
```

## How to use knife-vault
```bash
# to create a new vault
knife vault create $vault $item --json /path/to/the/item.json --search '*:*' -M client
# or
knife vault create $vault $item --json /path/to/the/item.json -A 'user_a,user_b,node01,node02' -M client

# to refresh key pairs if there are some news
knife vault refresh $vault $item --clean-unknown-clients
```

## How to 'chef_gem' with proxy
```ruby
chef_gem 'maas-client' do
  clear_sources             true
  include_default_source    true
  compile_time              true
  source                    'https://nexus.aregion.org/repository/rubygems-proxy/'
  action                    :install
end
```

## How to debug
```bash
kitchen login
cd /tmp/kitchen
vi cookbook_artifacts/$FIND_THE_RECIPE_AND_ADD_PRY
chef-client -z -j dna.json -c client.rb
```

## TODO
- bootstrap using local proxy or mirror

# Reference
- Chef
  - https://www.chef.io/
  - https://docs.chef.io/
  - https://discourse.chef.io/
  - https://docs.chef.io/chef_deprecations_client.html
- chef_gem vs. gem_package
  - https://discourse.chef.io/t/chef-gem-vs-gem-package/4347
- chef-client local mode
  - https://medium.com/@emachnic/using-policyfiles-with-chef-client-local-mode-4f47477b24db
- Zero
  - http://knife-zero.github.io/20_getting_started/
  - http://knife-zero.github.io/tips/with_policyfile/
- Vault
  - https://blog.chef.io/2016/01/21/chef-vault-what-is-it-and-what-can-it-do-for-you/
- Policyfile
  - https://yolover.poise.io/
- Kitchen
  - https://kitchen.ci/
- Debugging
  - https://github.com/chrisgit/chef-debugging/blob/master/pry_cookbook_debugging/README.md
- Provisioning
  - https://docs.chef.io/provisioning.html
  - https://github.com/chef/chef-provisioning
  - https://github.com/chef/chef-provisioning/wiki/Driver-Development
  - https://github.com/chef/chef-provisioning/wiki/Configuration
