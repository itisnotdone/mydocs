# Issues of Openstack on LXC

## sysctl configurations necessary

### fs.inotify.max_user_instances
#### Symptom
```bash
sudo lxc exec lxc01 -- bash
root@lxc01:~# systemctl start ssh
Failed to allocate directory watch: Too many open files
Job for ssh.service canceled.
```
#### Solution
```bash
echo "fs.inotify.max_user_instances=8192" | sudo tee -a /etc/sysctl.conf
fs.inotify.max_user_instances=8192

sudo sysctl -p
fs.inotify.max_user_instances = 8192
```

### net.ipv4.neigh.default.gc_???????
#### Symptom
```bash
tail -f /var/log/syslog
Dec 20 01:58:52 ac1 kernel: [5083435.525835] neighbour: arp_cache: neighbor table overflow!
Dec 20 02:00:06 ac1 kernel: [5083509.544540] neighbour: arp_cache: neighbor table overflow!
Dec 20 02:00:06 ac1 kernel: [5083509.544584] neighbour: arp_cache: neighbor table overflow!
Dec 20 02:00:21 ac1 kernel: [5083524.560119] neighbour: arp_cache: neighbor table overflow!
Dec 20 02:00:31 ac1 kernel: [5083534.899884] neighbour: arp_cache: neighbor table overflow!
Dec 20 02:00:31 ac1 kernel: [5083534.899951] neighbour: arp_cache: neighbor table overflow!
Dec 20 02:00:31 ac1 kernel: [5083534.911095] neighbour: arp_cache: neighbor table overflow!
Dec 20 02:00:31 ac1 kernel: [5083534.911163] neighbour: arp_cache: neighbor table overflow!
Dec 20 02:00:31 ac1 kernel: [5083534.911218] neighbour: arp_cache: neighbor table overflow!
Dec 20 02:00:31 ac1 kernel: [5083534.911272] neighbour: arp_cache: neighbor table overflow!
Dec 20 02:00:52 ac1 kernel: [5083555.919711] neighbour: arp_cache: neighbor table overflow!
```
#### Solution
https://www.cyberciti.biz/faq/centos-redhat-debian-linux-neighbor-table-overflow/
```bash
sudo sysctl -p
net.ipv4.neigh.default.gc_interval = 300
net.ipv4.neigh.default.gc_stale_time = 600
net.ipv4.neigh.default.gc_thresh3 = 4096
net.ipv4.neigh.default.gc_thresh2 = 2048
net.ipv4.neigh.default.gc_thresh1 = 1024
```
