#!/bin/bash
cd /Data/tgz/
wget http://downloads.sourceforge.net/mcrypt/libmcrypt-2.5.8.tar.gz
tar zxvf libmcrypt-2.5.8.tar.gz
cd libmcrypt-2.5.8/
./configure --prefix=/Data/apps/libs
make && make install
cd libltdl/
./configure --prefix=/Data/apps/libs --enable-ltdl-install
make && make install