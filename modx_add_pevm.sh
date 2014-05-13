#для установки нового с певм

tput rev
echo "!!! NEW SITE FROM PEVM!!!!"
tput sgr0

a1="pass.sh" ; source "$a1" ; if [ $? -ne 0 ] ; then echo "Error — no bashscripts $a1" 1>&2 ; exit 1 ; fi 
a1="input_param.sh" ; source "$a1" ; if [ $? -ne 0 ] ; then echo "Error — no bashscripts $a1" 1>&2 ; exit 1 ; fi 

DB_NAME=$(echo $DOMAIN | sed -e 's/\.//g')
DB_NAME=$(echo $DB_NAME | sed -e 's/\-//g')
DB_NAME=$(echo $DB_NAME | cut -c1-15)
echo "New database name:" $DB_NAME

DB_USER=$DB_NAME
echo "New database user:" $DB_USER

tput setaf 3
echo -n "Copy from pevm.ru? (Y/n) "
tput sgr0

read item
case "$item" in
    y|Y) echo "YES, copy from pevm.ru"
	     PATHOLD="/var/www/pevm.ru/data/www/pevm.ru"
        ;;
    n|N) echo "NO, copy new site! "
		 DOMAIN2=$DOMAIN
		 USERNAME2=$USERNAME
		 PATHNEW2=$PATHNEW
		 source input.sh           
		 PATHOLD=$PATHNEW
		 DOMAIN=$DOMAIN2
		 USERNAME=$USERNAME2
		 PATHNEW=$PATHNEW2
        ;;
    *) echo "default...from pevm.ru"
	   PATHOLD="/var/www/pevm.ru/data/www/pevm.ru"
        ;;
esac

echo "Copy from :" $PATHOLD


echo "!---------------Coping to new----------------------!" 


find "$PATHNEW" -type f -exec rm -rf {} \;

cp -R $PATHOLD/* $PATHNEW/
cp $PATHOLD/.htaccess $PATHNEW/

echo "copy done!"


a1="update_config.sh" ; source "$a1" ; if [ $? -ne 0 ] ; then echo "Error — no bashscripts $a1" 1>&2 ; exit 1 ; fi 
DB_DROP="0"
a1="db_create_isp.sh" ; source "$a1" ; if [ $? -ne 0 ] ; then echo "Error — no bashscripts $a1" 1>&2 ; exit 1 ; fi 
a1="db_set.sh" ; source "$a1" ; if [ $? -ne 0 ] ; then echo "Error — no bashscripts $a1" 1>&2 ; exit 1 ; fi 
a1="files_chmod.sh" ; source "$a1" ; if [ $? -ne 0 ] ; then echo "Error — no bashscripts $a1" 1>&2 ; exit 1 ; fi 
a1="print.sh" ; source "$a1" ; if [ $? -ne 0 ] ; then echo "Error — no bashscripts $a1" 1>&2 ; exit 1 ; fi 

