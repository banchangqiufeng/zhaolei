#!/bin/bash
mkdir -p /Data/data/mysql/data && chown -R mysql:mysql /Data/data/mysql
su mysql -c "/Data/apps/mysql/scripts/mysql_install_db --user=mysql --basedir=/Data/apps/mysql --datadir=/Data/data/mysql/data"