### Python2升级到Python3

```shell
yum -y install zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gcc make libffi-devel
wget https://www.python.org/ftp/python/3.8.13/Python-3.8.13.tgz
tar zxvf Python-3.8.13.tgz
cd Python-3.8.13
./configure --enable-optimizations
make
make install
```

### 软连接

```shell
ln -s /usr/local/python3/bin/python3 /usr/bin/python
ln -s /usr/local/python3/bin/pip3 /usr/bin/pip
```

### 分别更改python路径，分别将将文件第一行改成#! /usr/bin/python2.7

```shell
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

```shell
#检查python脚本语法工具
pip3 install {flake8,pylint,black,pre-commit}
pre-commit install
pre-commit sample-config >.pre-commit-config.yaml
flake8+pylint+black
```


```shell
#离线安装pip依赖.
pip download -d /root/down -r requirement.txt
pip install /root/down/*.whl  #拷贝到内网服务器安装.
```


```shell
#搭建pip仓库
pip3 install bandersnatch
grep -v '^;' /etc/bandersnatch.conf

[mirror]
directory = /root/pypi
json = false
release-files = true
cleanup = false
master = https://pypi.org
timeout = 30
global-timeout = 1800
workers = 3
hash-index = false
stop-on-error = false
storage-backend = filesystem
verifiers = 3


bandersnatch mirror
```
