#!/bin/bash
cd /Data/tgz/
wget http://prdownloads.sourceforge.net/libpng/libpng-1.6.2.tar.gz
tar zxvf libpng-1.6.2.tar.gz
cd libpng-1.6.2/
./configure --prefix=/Data/apps/libs
make && make install