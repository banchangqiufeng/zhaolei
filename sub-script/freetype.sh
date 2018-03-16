#!/bin/bash
cd /Data/tgz/
wget https://download.savannah.gnu.org/releases/freetype/freetype-2.4.12.tar.gz
tar zxvf freetype-2.4.12.tar.gz
cd freetype-2.4.12/
./configure --prefix=/Data/apps/libs
make && make install
