#!/bin/bash
#создание базы данных новой для модекса, и заливка дампа из старой
#не сделано: нужно сделать чтоб пользователь был общий для одного владельца


if [ ! "$DBASE_OLD_BASE" == "" ]; then 
	echo "----------------dump create-----------------------------"
	mysqldump -Q -u root --password=$ROOTPASS $DBASE_OLD_BASE >$MYPATH/tmp/$DBASE_OLD_BASE.sql 
	STATUS
	echo "From '$DBASE_OLD_BASE' to $MYPATH/tmp/$DBASE_OLD_BASE.sql"
fi

echo "!---------------Creating database----------------------!" 

echo "Database owner   :" $USERNAME

DB_EXIST=`/usr/local/ispmgr/sbin/mgrctl db | grep -i "name=$DB_NAME "`
STATUS
if [ "$DB_EXIST" == "" ]; then echo "NO EXIST DB - $DB_NAME. Create new..." ; else echo "DB EXIST '$DB_NAME': '$DB_EXIST'"; fi
	
if [ "$DB_EXIST" == "" ];
then
	echo ">>> DB_EXIST - dont drop" 
else
    DB_DROPOK=`/usr/local/ispmgr/sbin/mgrctl db.delete elid="MySQL->$DB_NAME"`
	STATUS
	echo ">>> DB_DROP '$DB_NAME' -> " $DB_DROPOK 
fi

DB_CREATE=`/usr/local/ispmgr/sbin/mgrctl db.edit name=$DB_NAME dbtype=MySQL owner=$USERNAME dbencoding=default dbuser=newuser dbusername=$DB_USER dbpassword=$MYSQLPASS sok=ok`
STATUS
echo ">>> DB_CREATE '$DB_NAME' for user '$DB_USER' -> " $DB_CREATE ;

CHEK=`/usr/local/ispmgr/sbin/mgrctl -m ispmgr db | grep -i name=$DB_NAME | cut -d\  -f1`
echo $CHEK
if [ "$CHEK" == "" ]; then echo ">>>>>>>NO DB $DB_NAME FIND. Exit<<<<<<" $CHEK; exit 1; fi
	

if [ ! "$DBASE_OLD_BASE" == "" ]; then 
	echo "---------------database import -----------------------"
	echo "From $MYPATH/tmp/$DBASE_OLD_BASE.sql to '$DB_NAME'"
	mysql  -u root --password=$ROOTPASS $DB_NAME <$MYPATH/tmp/$DBASE_OLD_BASE.sql 
	STATUS
fi


if [ "$DBASE_OLD_BASE" == "$DB_NAME" ];
then
      echo '$DBASE_OLD_BASE' "=" '$DB_NAME' " - dont DROP old database"
else

	if [ "$DB_DROP" == "0" ]; 
		then echo ">>> No drop '$DBASE_OLD_BASE' old base"
		else
			echo "-->DROP DATABASE '$DBASE_OLD_BASE'<--"
			#mysql -uroot --password=$ROOTPASS -e "DROP DATABASE $DBASE_OLD_BASE"
			/usr/local/ispmgr/sbin/mgrctl db.delete elid="MySQL->$DBASE_OLD_BASE"
			STATUS
		fi
fi

