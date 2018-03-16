#!/bin/bash
cd /Data/tgz
wget http://cn2.php.net/distributions/php-7.0.6.tar.gz
tar xzvf php-7.0.6.tar.gz 
cd php-7.0.6
./configure --prefix=/Data/apps/php7 --with-config-file-path=/Data/apps/php7/etc --with-mysqli=/Data/apps/mysql/bin/mysql_config --with-iconv=/Data/apps/libs/ --with-freetype-dir=/Data/apps/libs --with-jpeg-dir=/Data/apps/libs --with-png-dir=/Data/apps/libs --with-zlib --with-libxml-dir=/usr --enable-xml --disable-rpath --enable-bcmath --enable-shmop --enable-sysvsem --enable-inline-optimization --with-curl --enable-mbregex --enable-fpm --enable-mbstring --with-mcrypt=/Data/apps/libs --with-gd --enable-gd-native-ttf --with-openssl --with-mhash --enable-pcntl --enable-sockets --with-xmlrpc --enable-zip --with-bz2 --enable-soap --enable-opcache --with-pdo-mysql --enable-maintainer-zts --enable-pcntl --enable-shmop --enable-sysvmsg --enable-sysvsem --enable-sysvshm --without-pear --with-gettext  --enable-fpm --enable-opcache=no
make && make install
cp /Data/tgz/php-7.0.6/php.ini-development /Data/apps/php7/etc/php.ini
cp /Data/tgz/php-7.0.6/sapi/fpm/php-fpm.conf /Data/apps/php7/etc/php-fpm.conf
cp /Data/apps/php7/etc/php-fpm.d/www.conf.default /Data/apps/php7/etc/php-fpm.d/www.conf
cp /Data/tgz/php-7.0.6/sapi/fpm/init.d.php-fpm /etc/init.d/php-fpm
sed -i '23s#user = nobody#user = www#g' /Data/apps/php7/etc/php-fpm.d/www.conf
sed -i '24s#group = nobody#group = www#g' /Data/apps/php7/etc/php-fpm.d/www.conf
sed -i '36s#listen = 127.0.0.1:9000#listen = 0.0.0.0:9000#g' /Data/apps/php7/etc/php-fpm.d/www.conf
/Data/apps/php7/sbin/php-fpm
