# libvirt
## Network Definition
```bash
cat BRIDGE_NAME.xml
```
```xml
<network>
  <name>BRIDGE_NAME</name>
  <forward mode='bridge'/>
  <bridge name='BRIDGE_NAME'/>
  <virtualport type='openvswitch'/>
  <portgroup name='BRIDGE_NAME-25'>
    <vlan>
      <tag id='25'/>
    </vlan>
  </portgroup>
  <portgroup name='BRIDGE_NAME-26'>
    <vlan>
      <tag id='26'/>
    </vlan>
  </portgroup>
  <portgroup name='BRIDGE_NAME-27'>
    <vlan>
      <tag id='27'/>
    </vlan>
  </portgroup>
  <portgroup name='BRIDGE_NAME-29'>
    <vlan>
      <tag id='29'/>
    </vlan>
  </portgroup>
  <portgroup name='BRIDGE_NAME-23'>
    <vlan>
      <tag id='23'/>
    </vlan>
  </portgroup>
  <portgroup name='BRIDGE_NAME-11'>
    <vlan>
      <tag id='11'/>
    </vlan>
  </portgroup>
  <portgroup name='BRIDGE_NAME-12'>
    <vlan>
      <tag id='12'/>
    </vlan>
  </portgroup>
  <portgroup name='BRIDGE_NAME-13'>
    <vlan>
      <tag id='13'/>
    </vlan>
  </portgroup>
  <portgroup name='BRIDGE_NAME'>
  </portgroup>
  <mtu size='SIZE'/>
</network>
```
- Each portgroup that has a VLAN tagged defines each fake bridge generated by OVS
- The last portgroup that has no VLAN tagged defines the root bridge of the fake bridges which is a trunk
- ```<mtu size='SIZE'/>``` must be set if you use a specific mtu value for the network.
  - This element will be disappeared after the network definition, 'virsh net-define BRIDGE_NAME.xml'.
  - Being disappeared might be a bug. Report it if you want to
    - https://bugzilla.redhat.com/enter_bug.cgi?product=Virtualization%20Tools&component=libvirt