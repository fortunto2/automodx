#!/bin/bash
#обновление прав модекса

#echo "!---------------UPDATE CHMOD----------------------!" 

chown -R $USERNAME:$USERNAME $PATHNEW

find $PATHNEW -type d -exec chmod 755 {} \; ;STATUS
find $PATHNEW -type f -exec chmod 644 {} \; ;STATUS

find $PATHNEW/assets/cache -name "*.php" -not -name "siteCache.idx.php" -not -name "sitePublishing.idx.php" -delete

if [ -f "$PATHNEW" ]; then find $PATHNEW/webstat -delete ; fi
if [ -f "$PATHNEW" ]; then find $PATHNEW/cgi-bin -delete ; fi

chmod -R 777 $PATHNEW/assets/cache
chmod -R 777 $PATHNEW/assets/export
chmod -R 777 $PATHNEW/assets/files
chmod -R 777 $PATHNEW/assets/galleries
chmod -R 777 $PATHNEW/assets/images
chmod -R 777 $PATHNEW/assets/media
chmod -R 777 $PATHNEW/assets/flash
chmod -R 777 $PATHNEW/assets/cache/siteCache.idx.php
chmod -R 777 $PATHNEW/assets/cache/sitePublishing.idx.php
chmod -R 666 $PATHNEW/manager/includes/config.inc.php

chmod 755 $PATHNEW 

chmod 777 $PATHNEW/assets/plugins/managermanager/mm_rules.inc.php
chmod -R 777 $PATHNEW/assets/.thumbs



echo "CHMOD OK" 