#!/bin/bash

echo "Installing HTTPD"
yum install -y httpd

echo "Starting HTTPD"
systemctl start httpd.service

echo "Installing rsync"
yum install -y rsync

echo "Adding Firewall"
firewall-cmd --add-port 80/tcp --permanent
firewall-cmd --reload

echo "Checking HTTPD status"
systemctl restart httpd.service
systemctl status httpd.service

echo "Installing php"
yum install -y php php-mysql

echo "<?php phpinfo(); ?>" > /var/www/html/info.php

echo "Installing mariadb"
yum install -y mariadb-server mariadb

echo "Starting mariadb"
systemctl start mariadb

echo "Checking status mariadb"
systemctl status mariadb

echo "Installing mysql"
mysql_secure_installation << mdb  

y
dave
dave
y
y
y
y
mdb




echo "enable mariadb"
systemctl enable mariadb.service

echo "testing the installation"
mysqladmin -u root p version 

echo "creating mysql database and user"
mysql -u root -p << creating
CREATE DATABASE wordpress;
CREATE USER wordpressuser@localhost IDENTIFIED BY 'dave'; 
GRANT ALL PRIVILEGES ON wordpress.* TO wordpressuser@localhost IDENTIFIED BY 'dave'; 
FLUSH PRIVILEGES; 
exit 
creating


echo "installing wordpress"
yum install -y php-gd
service httpd restart 

echo "installing wget"
yum install -y wget
echo "geting wordpress file"
wget http://wordpress.org/latest.tar.gz
echo "extracting the file"
tar xzvf latest.tar.gz

rsync -avP ~/wordpress/ /var/www/html
mkdir /var/www/html/wp-content/uploads
chown -R apache:apache /var/www/html/*


echo "configure wordpress"
cd /var/www/hmtl
cp wp-config-sample.php wp-config.php 
sed -i 's/database_name_here/wordpress/g' /var/www/html/wp-config.php
sed -i 's/username_here/wordpressuser/g' /var/www/html/wp-config.php
sed -i 's/password_here/dave/g' /var/www/html/wp-config.php

echo "updating"
yum install -y http://rpms.remirepo.net/enterprise/remi-release-7.rpm
yum install -y yum-utils
yum-config-manager --enable remi-php56
yum install -y php php-mcrypt php-cli php-gd php-curl php-mysql php-ldap php-zip php-fileinfo

echo "restarting httpd"
systemctl restart httpd