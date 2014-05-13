#!/bin/bash
#создание базы данных новой для модекса, и заливка дампа из старой
#надо сделать проверки различные, и сделать заливку в юзера и проверка есть ли он

echo "!---------------Creating database----------------------!" 

Q1="CREATE DATABASE IF NOT EXISTS $DB_NAME DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;;"
Q2="GRANT ALTER,DELETE,DROP,CREATE,INDEX,INSERT,SELECT,UPDATE,CREATE TEMPORARY TABLES,LOCK TABLES ON $DB_NAME.* TO '$DB_USER'@'localhost' IDENTIFIED BY '$MYSQLPASS';"
Q3="FLUSH PRIVILEGES;"
SQL="${Q1}${Q2}${Q3}"

mysql -uroot --password=$ROOTPASS -e "$SQL"
echo "database create!"

mysqldump -Q -u root --password=$ROOTPASS $DBASE_OLD_BASE >./tmp/$DBASE_OLD_BASE.sql 
echo "dump done!"

mysql  -u root --password=$ROOTPASS $DB_NAME <./tmp/$DBASE_OLD_BASE.sql 
echo "database import done!"

if [ "$DBASE_OLD_BASE" == "$DB_NAME" ];
then
      echo $DBASE_OLD_BASE "=" $DB_NAME " - dont DROP old database"
else

	if [ "$DB_DROP" == "0" ]; 
		then echo "No drop old base"
		else
			echo "-->DROP DATABASE $DBASE_OLD_BASE<--"
			mysql -uroot --password=$ROOTPASS -e "DROP DATABASE $DBASE_OLD_BASE"
		fi
fi