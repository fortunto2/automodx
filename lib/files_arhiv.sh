#!/bin/bash
#копирования модекса в архив, и запаковка

echo "!---------------ANTIVIRUS MALDET----------------------!" 
maldet -a $PATHNEW | grep -i "scan completed on"

if [ ! -d "/backup/arhiv/$DOMAIN" ]; then

	echo "!---------------Coping to arhiv----------------------!" 
	echo "create /backup/arhiv/$DOMAIN"

	mkdir /backup/arhiv/$DOMAIN
	mkdir /backup/arhiv/$DOMAIN/files

	find $PATHNEW/assets/cache -name "*.php" -not -name "siteCache.idx.php" -not -name "sitePublishing.idx.php" -delete

	cp -R $PATHNEW/* /backup/arhiv/$DOMAIN/files

	echo "coping to arhiv done!"

	tar -czf /backup/arhiv/$DOMAIN/$DOMAIN.tar.gz /backup/arhiv/$DOMAIN/files
	find /backup/arhiv/$DOMAIN/files -delete
	
	tar -czf /backup/arhiv/$DOMAIN/base_$DOMAIN.tar.gz ./tmp/arh/$DBASE_OLD_BASE.sql
	
	echo "tar.gzip done!"

	chmod -R 640 /backup/arhiv/$DOMAIN/

	echo "delete old!"

	find $PATHNEW -delete

	else
	
	echo "Folder exist /backup/arhiv/$DOMAIN - DELETE FIRST!!!!"

fi
