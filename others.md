# Others

## How to run java console for DELL iDRAC using openjdk and firefox
```bash
sudo apt install openjdk-8-jdk icedtea-plugin
 
# https://www.dell.com/community/Systems-Management-General/Using-virtual-console-Network-connection-has-dropped/td-p/6067842
sudo updatedb
locate java.security
 
vi /etc/java-8-openjdk/security/java.security
# delete "3DES_EDE_CBC" with comma ahead
```
