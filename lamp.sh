#!/bin/bash

echo "Installing HTTPD"
yum install -y httpd

echo "Starting HTTPD"
systemctl start httpd.service

echo "Adding Firewall"
firewall-cmd --add-port 80/tcp --permanent
firewall-cmd --reload

echo "Checking HTTPD status"
systemctl status httpd.service

echo "Installing mariadb"
yum install -y mariadb-server mariadb

echo "Starting mariadb"
systemctl start mariadb

echo "Checking status mariadb"
systemctl status mariadb

echo "Installing mysql"
mysql_secure_installation
