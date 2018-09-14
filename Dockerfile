FROM python:latest
RUN mkdir /root/.pip && echo '[global]' > /root/.pip/pip.conf && sed -i '$a\index-url = http://mirrors.aliyun.com/pypi/simple/'  /root/.pip/pip.conf && sed -i '$a\[install]' /root/.pip/pip.conf && sed -i '$a\trusted-host=mirrors.aliyun.com' /root/.pip/pip.conf && pip install pillow requests selenium scrapy django mkl numpy scipy matplotlib pandas PyOpenGL
