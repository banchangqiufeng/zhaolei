#!/bin/bash
cd /Data/tgz/
wget http://downloads.sourceforge.net/mcrypt/mcrypt-2.6.8.tar.gz
tar zxvf mcrypt-2.6.8.tar.gz
cd mcrypt-2.6.8/
export LDFLAGS="-L/Data/apps/libs/lib -L/usr/lib"
export CFLAGS="-I/Data/apps/libs/include -I/usr/include"
touch malloc.h
./configure --prefix=/Data/apps/libs --with-libmcrypt-prefix=/Data/apps/libs
make && make install