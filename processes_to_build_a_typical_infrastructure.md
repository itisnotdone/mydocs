# Processes to build a typical infrastructure

## Design network architecture
- [ ] Define networks considering their purposes and corresponding VIDs
- [ ] How big host ID will be needed for each network

## Define official domains
- [ ] Pick a domain to be used and seperate it into the following set of environments
  - [ ] production, stage, and development(i.e., example.com, stage-example.com, dev-example.com)
  - [ ] Create a public key infrastrucrure(PKI) for the environments to provide CA signed certificates for various services.
  - [ ] Create CA signed user public keys for SSH authentication so users can access servers with CA public key.

## Build development environment
- [ ] Build virtualized networks as designed above using virtual switch solutions such as linux bridge and OVS
- [ ] Prepare storge pools using advanced file systems such as ZFS
- [ ] Initialize virtualization solutions such as Libvirt, LXD and Docker

## Design rack formation and switch topology
- [ ] How many servers will be needed
- [ ] How many racks will be needed
- [ ] How many servers will be placed per a rack
- [ ] How to prepare server NICs
- [ ] How to cable and configure NICs with TORs

## Setup services using containers
- [ ] Directory service such as LDAP
- [ ] Package repository such as mirror, proxy and Nexus
- [ ] Baremetal provisioner such as MAAS and Foreman
- [ ] Configuration automation solutions such as Chef, Ansible and Puppet
- [ ] SQL Databases such as MySQL and PostgreSQL
- [ ] NoSQL Databases such as MongoDB and Redis
- [ ] Collecting logs and metrics
- [ ] Reporting and Alerting
- [ ] Loadbalancing and high-availability solutions such as Keepalived and Haproxy
- [ ] Continuous integration solutions such as Jenkins

