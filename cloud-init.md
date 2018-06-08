# Reference
- General
  - https://cloudinit.readthedocs.io/en/latest/index.html
# NoCloud
- Useful when dealing with KVM without any help from cloud solutions
- http://cloudinit.readthedocs.io/en/latest/topics/datasources/nocloud.html#datasource-nocloud
- https://gist.github.com/smoser/635897f845f7cb56c0a7ac3018a4f476

## userdata.yml
```yaml
#cloud-config
password: passw0rd
chpasswd: { expire: False }
ssh_pwauth: True
```

## netconf.yml
```yaml
version: 1
config:
  - type: physical
    name: eth0
    subnets:
      - type: static
        address: 192.168.10.10/24
        gateway: 192.168.10.1
      - type: nameserver:
        address:
          - 8.8.8.8

```
## Create a seed image and attach it into the instance as CD-ROOM
```bash
cloud-localds -v -H myvm01 -N netconf.yml seed.img userdata.yml
```
