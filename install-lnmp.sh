#!/bin/bash
#创建工作目录
mkdir -p /Data/apps		#软件存放目录
mkdir -p /Data/tgz		#源码包存放目录
mkdir -p /Data/data 	#数据存放目录
mkdir -p /Data/logs		#日志存放目录
mkdir -p /Data/webapps	#项目存放目录

#变量
NGINX_FILE=/usr/lib/systemd/system/nginx.service
PHP_FILE=/Data/apps/php7/etc/php-fpm.conf
WWW_USER=`cat /etc/passwd | grep www | awk -F ":" '{print $1}'`
MYSQL_USER=`cat /etc/passwd | grep mysql | awk -F ":" '{print $1}'`
#PACKAGE=(wget openssl* gcc gcc-c++ autoconf libjpeg libjpeg-devel libpng libpng-devel freetype freetype-devel libxml2 libxml2-devel zlib zlib-devel glibc glibc-devel glib2 glib2-devel bzip2 bzip2-devel ncurses ncurses-devel curl curl-devel e2fsprogs e2fsprogs-devel krb5-devel libidn libidn-devel openssl openssl-devel openldap openldap-devel nss_ldap openldap-clients openldap-servers make gd gd-devel libaio lzip)
#SCRIPT=(pcre nginx mysql initialize_mysql configure_mysql jpeg libpng freetype libmcrypt mhash libiconv mcrypt php)
#安装依赖包
for BAO in wget openssl* gcc gcc-c++ autoconf libjpeg libjpeg-devel libpng libpng-devel freetype freetype-devel libxml2 libxml2-devel zlib zlib-devel glibc glibc-devel glib2 glib2-devel bzip2 bzip2-devel ncurses ncurses-devel curl curl-devel e2fsprogs e2fsprogs-devel krb5-devel libidn libidn-devel openssl openssl-devel openldap openldap-devel nss_ldap openldap-clients openldap-servers make gd gd-devel libaio lzip;
do
	yum -y install $BAO
	if [ $? -eq 0 ]
	then
		echo "Successful installation"
	fi
done

#创建nginx用户
egrep "^www" /etc/passwd >& /dev/null
if [ $? -ne 0 ]
then
	/usr/sbin/groupadd www && /usr/sbin/useradd -s /sbin/nologin -g www www
fi

#创建mysql用户
egrep "^mysql" /etc/passwd >& /dev/null
if [ $? -ne 0 ]
then
	groupadd mysql && useradd -r -g mysql mysql
fi

#创建libs目录
if [ ! -d /Data/apps/libs ]
	then
		mkdir -p /Data/apps/libs
fi

#设置系统资源
ulimit -SHn 65535

#源码包编译
for I in pcre nginx mysql initialize_mysql configure_mysql jpeg libpng freetype libmcrypt mhash libiconv mcrypt php;
do
	/bin/bash sub-script/$I.sh

	if [ $? -eq 0 ]
		then
			echo "Compiled successfully"
	fi
done

if [ ! -d $NGINX_FILE ]
	then
		cat document/nginx_systemd > $NGINX_FILE
fi

#配置PHP-FPM
if [ -d $PHP_FILE ]
	then
		sed -i 's#^;pid = run/php-fpm.pid#pid = run/php-fpm.pid#g' $PHP_FILE
		sed -i 's#^;error_log = log/php-fpm.log#error_log = log/php-fpm.log#g' $PHP_FILE
		sed -i 's#^;daemonize = yes#daemonize = yes#g' $PHP_FILE
		sed -i '21i\include=/Data/apps/php7/etc/php-fpm.d/*.conf' $PHP_FILE
		chmod +x /etc/init.d/php-fpm
		/etc/init.d/php-fpm start
		chkconfig --add php-fpm
		chkconfig php-fpm on
fi

#install wordpress
/bin/bash sub-script/wordpress.sh
