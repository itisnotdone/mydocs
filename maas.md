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

### To debug 'maas' command
- `maas` command uses python3
  - if you want to debug with `ptpython` you need to `apt install python3-pip` to install `ptpython`
- '/usr/lib/python3/dist-packages/maascli/api.py'
  - the module that deals with http request and response

### To debug MAAS server
- /usr/lib/python3/dist-packages/maasserver/djangosettings/settings.py
  - Change `DEBUG = False` to `DEBUG = True`
