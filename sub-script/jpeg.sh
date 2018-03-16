#!/bin/bash
cd /Data/tgz/
wget http://www.ijg.org/files/jpegsrc.v9.tar.gz     
tar zxvf jpegsrc.v9.tar.gz
cd jpeg-9/
./configure --prefix=/Data/apps/libs --enable-shared --enable-static
make && make install