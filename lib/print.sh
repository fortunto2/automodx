#!/bin/bash
#вывод паролей на экран, файлы, почту

echo "!---------------GO----------------------!"

echo "
!FIRST GO to install http://$DOMAIN/install/

http://$DOMAIN/
http://$DOMAIN/ispmanager
ispmanager user: $USERNAME

http://$DOMAIN/manager
admin: $PASSWORD
#manager: $PASSWORD_USER

Mysql User: $DB_USER
Mysql Database: $DB_NAME
Mysql password: $MYSQLPASS

Path: $PATHNEW

" > /var/www/$USERNAME/data/pass_$DOMAIN.txt

cat /var/www/$USERNAME/data/pass_$DOMAIN.txt

cat /var/www/$USERNAME/data/pass_$DOMAIN.txt | mail -s "NewSite: $DOMAIN" $ADMIN 

chmod 600 /var/www/$USERNAME/data/pass_$DOMAIN.txt