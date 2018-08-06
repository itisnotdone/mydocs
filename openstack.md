# Openstack

## DVR

### On compute node
- qrouter
  - does 'one to one' SNAT with the chain named 'neutron-l3-agent-float-snat' when postrouting, forwarding the packet to fip that has the routing entry to the externel(provider) network
  - does 'one to one' DNAT with the chain named 'neutron-l3-agent-PREROUTING' when prerouting
  - each qrouter has an interface which is connected with fip as DVR internel network which behaves like a serial network 
- fip
  - routes packets that have floating IPs as its SRC or DST through the interfaces between fip and qrouters
  - has a routing entry that points the gateway of the provider network.
  
  ### On network node
