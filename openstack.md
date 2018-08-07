# Openstack

## DVR

### On compute node
- floating IP or provider network
  - configure a tagged vlan interface from the main fabric interace such as eth0 or bond0, and attach the tagged interface directly to the external bridge named such as br-ext or br-provider
- qrouter(network namespace)
  - perform 'one to one' SNAT with the chain named 'neutron-l3-agent-float-snat' when postrouting, forwarding the packet to fip that has the routing entry to the externel(provider) network
  - perform 'one to one' DNAT with the chain named 'neutron-l3-agent-PREROUTING' when prerouting
  - each qrouter has an interface which is connected with fip as DVR internel network which behaves like a serial routing network 
- fip(network namespace)
  - routes packets that have floating IPs as its SRC or DST through the interfaces between fip and qrouters
  - has a routing entry that points the gateway of the provider network.

### On network node
- floating IP or provider network
  - configure a tagged vlan interface from the main fabric interace such as eth0 or bond0, and attach the tagged interface directly to the external bridge named such as br-ext or br-provider
- snat(network namespace)
  - perform SNAT and DNAT for instances that do not have any floating IPs assigned
