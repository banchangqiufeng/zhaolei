#!/bin/bash
cd /Data/tgz/
wget http://downloads.mysql.com/archives/mysql-5.6/mysql-5.6.12-linux-glibc2.5-x86_64.tar.gz
tar zxvf mysql-5.6.12-linux-glibc2.5-x86_64.tar.gz
mv mysql-5.6.12-linux-glibc2.5-x86_64 /Data/apps/mysql
chown -R mysql:mysql /Data/apps/mysql