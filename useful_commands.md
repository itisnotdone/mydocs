# Useful Commands

## bash

### !!
To place last command
```bash
ovs-vsctl show
ovs-vsctl: unix:/var/run/openvswitch/db.sock: database connection failed (Permission denied)

sudo !!
sudo ovs-vsctl show
1cb59b3e-96af-4b38-bcf4-765ff673b931
    ovs_version: "2.9.2"
```
### Ctrl + x + e
To open an editor to write and run a script

### fc
To open an editor with the last command, and edit and run again

### disown -a && exit
To exit terminal leaving all processes running

### Ctrl + r
To search a command from the history
