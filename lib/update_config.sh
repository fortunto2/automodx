#!/bin/bash
#замена в конфиге модекса

echo "!---------------config.inc.php OLD to NEW----------------------!" 

USER_OLD_BASE=`cat $PATHNEW/manager/includes/config.inc.php | grep -i database_user | cut -d\' -f2`  #ищем юзера 
DBASE_OLD_BASE=`cat $PATHNEW/manager/includes/config.inc.php | grep -i dbase| cut -d\' -f2`  #ищем базу 

proverka=`echo $DBASE_OLD_BASE | awk '/\`/'`
if [ ! "$proverka" == "" ];
then
echo "Udalaem kovichki v:" $proverka
DBASE_OLD_BASE=`echo $DBASE_OLD_BASE |sed 's/^.//'`
DBASE_OLD_BASE=`echo $DBASE_OLD_BASE |sed 's/.$//'`
fi

PASS_OLD_BASE=`cat $PATHNEW/manager/includes/config.inc.php | grep -i database_password| cut -d\' -f2`  #ищем пароль

sed -i "/database_user/ s/$USER_OLD_BASE/$DB_USER/g" $PATHNEW/manager/includes/config.inc.php 
sed -i "/dbase/ s/$DBASE_OLD_BASE/$DB_NAME/g" $PATHNEW/manager/includes/config.inc.php
sed -i "/database_password/ s/$PASS_OLD_BASE/$MYSQLPASS/g" $PATHNEW/manager/includes/config.inc.php

echo "USER: " $USER_OLD_BASE " -->" `cat $PATHNEW/manager/includes/config.inc.php | grep -i database_user | cut -d\' -f2`
echo "DBASE: " $DBASE_OLD_BASE " -->" `cat $PATHNEW/manager/includes/config.inc.php | grep -i dbase | cut -d\' -f2`
echo "PASS: " $PASS_OLD_BASE " -->" `cat $PATHNEW/manager/includes/config.inc.php | grep -i database_password | cut -d\' -f2`