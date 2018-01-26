# How to use knife-solo

```bash
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

# How to use knife-vault
```bash
# to create a new vault
knife vault create $vault $item --json /path/to/the/item.json --search '*:*' -M client
# or
knife vault create $vault $item --json /path/to/the/item.json -A 'user_a,user_b,node01,node02' -M client

# to refresh key pairs if there are some news
knife vault refresh $vault $item --clean-unknown-clients
```

## TODO
- bootstrap using local proxy or mirror

# Reference
https://www.chef.io/
https://docs.chef.io/
https://discourse.chef.io/
