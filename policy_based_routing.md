
### Policy Routing
http://stud.netgroup.uniroma2.it/~cgrl/2014/slides/8-pbr.pdf

### Martian Source
http://www.softpanorama.org/Net/Internet_layer/Routing/martian_source.shtml
https://wiki.gentoo.org/wiki/Policy_based_routing#Requirements

### Else
- https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/6/html/Security_Guide/sect-Security_Guide-Server_Security-Reverse_Path_Forwarding.html
- /etc/sysctl.conf

When a server needs to route packets to a specific client(destination), the routing entry will be as follow.
- Source: the IP addresse of the output interface of the server
- Gate Device: the output interface of the server
- Gateway: the gateway IP of the network where the source IP is
- Destination: the IP addresse or CIDR of the clients


```sh
#!/bin/bash

VID=117
DST_IP=10.22.116.21   # This can be anything
SRC_IP=10.99.117.11
GATEWAY=10.99.117.1
GATE_DEV=ens3.117

if ! grep v$VID /etc/iproute2/rt_tables; then
  sudo echo "$VID v$VID" >> /etc/iproute2/rt_tables
fi

INTERFACES=$(ls /proc/sys/net/ipv4/conf/)

if [ "$1" == "up" ]; then
  ACTION=add
  for INF in $INTERFACES; do
    echo 0 > /proc/sys/net/ipv4/conf/$INF/rp_filter;  # doesn't seem to matter but log at the begining
    echo 1 > /proc/sys/net/ipv4/conf/$INF/log_martians;
    echo 1 > /proc/sys/net/ipv4/conf/$INF/accept_source_route;  # doesn't seem to matter
    echo 1 > /proc/sys/net/ipv4/conf/$INF/send_redirects;  # doesn't seem to matter
  done
elif [ "$1" == "down" ]; then
  ACTION=del
  for INF in $INTERFACES; do
    echo 0 > /proc/sys/net/ipv4/conf/$INF/rp_filter;
    echo 1 > /proc/sys/net/ipv4/conf/$INF/log_martians;
    echo 0 > /proc/sys/net/ipv4/conf/$INF/accept_source_route;
    echo 0 > /proc/sys/net/ipv4/conf/$INF/send_redirects;
  done
fi

ip rule $ACTION from $SRC_IP lookup v$VID
ip rule list

ip route $ACTION default via $GATEWAY dev $GATE_DEV src $SRC_IP table v$VID
or
ip route $ACTION 10.22.0.0/16 via $GATEWAY dev $GATE_DEV src $SRC_IP table v$VID

ip route flush cache
ip route list table v$VID
ip route get to $DST_IP from $SRC_IP

# To make it permanent put following line at the corresponding interface
i.e.
post-up ip rule add from default lookup v117 && ip route add 10.22.116.21 via 10.99.117.1 dev $IFACE src 10.99.117.11 table v117
```
