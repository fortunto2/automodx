#!/bin/bash
#для удаления ненужного домена и его файлов везде

echo "!!! ALL DELETE!!!!"

source ./lib/pass.sh  //подключаем файлы паролей
source ./lib/input.sh  //подключаем ввод


DBASE_OLD_BASE=`cat $PATHNEW/manager/includes/config.inc.php | grep -i dbase| cut -d\' -f2`  #ищем базу 

if [ "$DBASE_OLD_BASE" == "" ];
then
	echo "!!!NO DATABASE FOUND: " $DBASE_OLD_BASE 
else 

	proverka=`echo $DBASE_OLD_BASE | awk '/\`/'`
	if [ ! "$proverka" == "" ];
		then
		echo "Udalaem kovichki v:" $proverka
		DBASE_OLD_BASE=`echo $DBASE_OLD_BASE |sed 's/^.//'`
		DBASE_OLD_BASE=`echo $DBASE_OLD_BASE |sed 's/.$//'`
	fi

echo "DBASE to dump: " $DBASE_OLD_BASE 
source ./lib/db_dupm_delete.sh  //бекап и удаление
fi

source ./lib/delete.sh  //удаление файлов
source ./lib/domen_delete.sh  //удаления домена из панели

echo "!----------OK! All delete-----------!"
