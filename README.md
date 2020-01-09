### Python2升级到Python3

```
yum install gcc gcc-c++ make openssl openssl-devel libffi-devel zlib* -y
tar zxvf Python-3.x.x.tgz
cd Python-3.x.x.tgz
./configure --prefix=/usr/local/python3 --with-ssl
```

### 软连接

```
ln -s /usr/local/python3/bin/python3 /usr/bin/python
ln -s /usr/local/python3/bin/pip3 /usr/bin/pip
```

### 分别更改python路径，分别将将文件第一行改成#! /usr/bin/python2.7

```
vi /usr/bin/yum
#! /usr/bin/python2.7
vi /usr/libexec/urlgrabber-ext-down
#! /usr/bin/python2.7
#下面的路径也需要改
vi /usr/share/createrepo/genpkgmetadata.py
#!/usr/bin/python2.7 -t
vi /usr/share/createrepo/worker.py
#!/usr/bin/python2.7 -tt
```

