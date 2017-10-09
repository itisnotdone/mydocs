# How to use knife-solo

```bash
gogetit create solo01

knife solo prepare ubuntu@solo01

vi nodes/solo01.json
# Add runlist

knife solo cook ubuntu@solo01
```
## TODO
- bootstrap using local proxy or mirror
