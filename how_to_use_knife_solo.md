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
## TODO
- bootstrap using local proxy or mirror
