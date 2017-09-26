# Processes to build a typical infrastructure

## Design network architecture
- [ ] Define networks considering their purposes and corresponding VIDs
- [ ] How big host ID will be needed for each network

## Define official domains
- [ ] Pick a domain to be used and seperate it into following set of environment
  - [ ] production, stage, and development(i.e., example.com, stage-example.com, dev-example.com)
  - [ ] Create CA or self signed SSL certificates for each environment that will be used by various services
  - [ ] Create another self signed certificates for SSH authentication to be able to use CA signed public keys

## Build development environment with virtualization solutions
- [ ] Build virtualized networks as designed above using virtual switch solutions such as linux bridge and OVS.

## Design rack formation and switch topology
- [ ] How many servers will be needed
- [ ] How many racks will be needed
- [ ] How many servers will be placed per a rack
- [ ] How to prepare servers` NICs
- [ ] How to cable and configure NICs with TORs
