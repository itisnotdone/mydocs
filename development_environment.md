# Development Environment
## aregion.org, 10.11.0.0/16
| Name | VID | CIDR | Desc |
| :--: | :--: | :--: | :--- |
| bm-switch | 10 | 10.11.10.0/24 | baremetal switches |
| IPMI | 11 | 10.11.11.0/24 | IPMI of baremetal servers |
| bm-server | 12 | 10.11.12.0/24 | baremetal servers / ceph-public |
| infra-svc | 13 | 10.11.13.0/24 | infrastructural services that will shipped on LXD and KVM(Libvirt) / ceph-public |
| k8s | 16 | 10.11.16.0/22 | infrastructural services that will be shipped on kubernetes / ceph-public |
| os-admin | 20 | 10.11.20.0/24 | Openstack management and admin-api / ceph-public |
| os-public | 21 | 10.11.21.0/24 | Openstack public-api |
| os-floating | 24 | 10.11.24.0/24 | Openstack floating-ip / ceph-public |
| os-tunnel | 200 | 192.168.200.0/24 | Openstack tunnel |
| ceph-cluster | 201 | 192.168.201.0/24 | ceph cluster |






## bregion.org, 10.22.0.0/16
