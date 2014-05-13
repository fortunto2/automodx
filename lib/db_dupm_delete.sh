#!/bin/bash
#бекап базы и удаление ее

echo "!---------------DUMP and DROP database----------------------!" 
echo "Dump to /tmp/arh/$DBASE_OLD_BASE.sql"
mysqldump -Q -u root --password=$ROOTPASS $DBASE_OLD_BASE >./tmp/arh/$DBASE_OLD_BASE.sql 

echo "-->DROP DATABASE $DBASE_OLD_BASE<--"
mysql -uroot --password=$ROOTPASS -e "DROP DATABASE $DBASE_OLD_BASE"
