#!/bin/bash

echo "creating a folder in opt"
cd /opt
mkdir backups

echo "go inside the folder"
cd /opt/backups

echo "backup using mysqldump"
mysqldump -u root -pdave wordpress > wordpress_10182021.sql

mysqldump -u root -pdave wordpress > wordpress_withdata_10182021.sql

echo "Compressing The File"
tar -zcf wordpress_10182021.tar.gz wordpress_10182021.sql
tar -zcf wordpress_withdata_10182021.tar.gz wordpress_withdata_10182021.sql