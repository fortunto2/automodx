#!/bin/bash
#копирования модекса из папки для обновления

echo "!---------------ANTIVIRUS MALDET----------------------!" 
/usr/local/sbin/maldet -a $PATHNEW | grep -i "scan completed on"

echo "!---------------delete all *.php----------------------!" 

find $PATHNEW/assets/cache -name "*.php" -delete
find $PATHNEW/assets/export -name "*.php" -delete
find $PATHNEW/assets/files -name "*.php" -delete
find $PATHNEW/assets/galleries -name "*.php" -delete
find $PATHNEW/assets/images -name "*.php" -delete
find $PATHNEW/assets/media -name "*.php" -delete
find $PATHNEW/assets/flash -name "*.php" -delete

echo "!---------------Coping modx 1.0.8----------------------!" 

cp -R $MYPATH/modx-1.0.8/* $PATHNEW
cp $MYPATH/modx-1.0.8/.htaccess $PATHNEW

find $PATHNEW/assets/cache -name "docid*.php" -delete


echo "coping done!"