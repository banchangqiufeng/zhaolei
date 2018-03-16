#!/bin/bash
cd /Data/tgz/
wget http://nginx.org/download/nginx-1.10.1.tar.gz
tar zxvf nginx-1.10.1.tar.gz
cd /Data/tgz/nginx-1.10.1
./configure --user=www --group=www --prefix=/Data/apps/nginx --with-http_stub_status_module --with-http_ssl_module --with-pcre=/Data/tgz/pcre-8.38 --with-http_realip_module --with-http_image_filter_module
make && make install