#!/bin/bash
cd /Data/tgz/
wget http://downloads.sourceforge.net/mhash/mhash-0.9.9.9.tar.gz
tar zxvf mhash-0.9.9.9.tar.gz
cd mhash-0.9.9.9/
./configure --prefix=/Data/apps/libs
make && make install