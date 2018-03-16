#!/bin/bash
mkdir /web
cd /Data/tgz
wget https://cn.wordpress.org/wordpress-4.5.2-zh_CN.tar.gz
tar zxvf wordpress-4.5.2-zh_CN.tar.gz -C /web
cp /web/wordpress/wp-config-sample.php /web/wordpress/wp-config.php
sed -i 's#database_name_here#wordpress'#g' /web/wordpress/wp-config.php
sed -i 's#username_here#root#g' /web/wordpress/wp-config.php
sed -i 's#password_here#123.com#g' /web/wordpress/wp-config.php
sed -i 's#localhost#127.0.0.1#g' /web/wordpress/wp-config.php
cat /root/install_lnmp/document/nginx_file > /Data/apps/nginx/conf/nginx.conf
systemctl restart nginx
