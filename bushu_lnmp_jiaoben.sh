#!/bin/bash
yum -y install gcc openssl-devel pcre-devel mariadb mariadb-server mariadb-devel php php-mysql php-fpm &> /dev/null
tar -xf Downloads/lnmp_soft.tar.gz
tar -xf lnmp_soft/nginx-1.12.2.tar.gz
cd nginx-1.12.2
./configure --with-http_ssl_module
make && make install &> /dev/null
sed -i '45s/index/index index.php/' /usr/local/nginx/conf/nginx.conf
sed -i '65,71s/#//' /usr/local/nginx/conf/nginx.conf
sed -i '69s/fast/#fast/' /usr/local/nginx/conf/nginx.conf
sed -i '70s/_params/.conf/' /usr/local/nginx/conf/nginx.conf
/usr/local/nginx/sbin/nginx
systemctl start mariadb
systemctl enable mariadb
systemctl start php-fpm
systemctl enable php-fpm
