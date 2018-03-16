#!/bin/bash
cp /Data/apps/mysql/support-files/my-default.cnf /etc/my.cnf && cp /Data/apps/mysql/support-files/mysql.server /etc/init.d/mysql

sed -i 's#^basedir=#basedir=/Data/apps/mysql#g' /etc/init.d/mysql
sed -i 's#^datadir=#datadir=/Data/data/mysql/data#g' /etc/init.d/mysql
sed -i '$a\export MYSQL_HOME="/Data/apps/mysql"' /etc/profile
sed -i '$a\export PATH="$PATH:$MYSQL_HOME/bin"' /etc/profile
source /etc/profile
chkconfig --add mysql
chkconfig mysql on
service mysql start

/Data/apps/mysql/bin/mysqladmin -u root password 123.com
/Data/apps/mysql/bin/mysql -u root -p123.com -e "create database wordpress;"
/Data/apps/mysql/bin/mysql -u root -p123.com -e "grant all privileges on *.* to 'root'@'%' identified by '123.com' with grant option;"
/Data/apps/mysql/bin/mysql -u root -p123.com -e "flush privileges;"
