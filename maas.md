# MAAS
## CentOS image
### Configure /etc/yum.repos.d/*.repo
```sh
sed -i '/^mirrorlist=.*/d' /etc/yum.repos.d/*.repo
sed -i 's/^#\(baseurl=.*\)/\1/g' /etc/yum.repos.d/*.repo
sed -i 's/mirror.centos.org\/centos/centos.mirror.cdnetworks.com/g' /etc/yum.repos.d/CentOS-*.repo
sed -i 's/download.fedoraproject.org\/pub/ftp.jaist.ac.jp\/pub\/Linux\/Fedora/g' /etc/yum.repos.d/epel*.repo
mv -v /etc/yum.repos.d/CentOS-Media.repo /etc/yum.repos.d/CentOS-Media.repo.bak
```

### Configure necessary packages
```sh
yum install -y tree vim mlocate psmisc bind-utils sysstat telnet 
```
