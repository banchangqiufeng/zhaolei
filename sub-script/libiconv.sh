#!/bin/bash
cd /Data/tgz/
wget http://ftp.gnu.org/pub/gnu/libiconv/libiconv-1.14.tar.gz
tar -zxvf libiconv-1.14.tar.gz
cd libiconv-1.14
./configure --prefix=/Data/apps/libs
sed -i -e '/gets is a security/d' srclib/stdio.in.h
make && make install
sed -i '1i\/Data/apps/libs/lib' /etc/ld.so.conf
/sbin/ldconfig