#!/bin/bash
#задание в базе параметров, пути новые, пароль новый для админа

echo "!---------------Set database----------------------!" 

Q1="UPDATE $DB_NAME.modx_manager_users SET password = MD5('$PASSWORD') WHERE  modx_manager_users.username ='admin';"
Q2="UPDATE $DB_NAME.modx_system_settings SET  setting_value =  '$PATHNEW/assets/' WHERE  modx_system_settings.setting_name =  'rb_base_dir';"
Q3="UPDATE $DB_NAME.modx_system_settings SET  setting_value =  '$PATHNEW/' WHERE  modx_system_settings.setting_name =  'filemanager_path';"

Q4="UPDATE $DB_NAME.modx_manager_users SET password = MD5('$PASSWORD_USER') WHERE  modx_manager_users.username ='manager';"

Q5="TRUNCATE $DB_NAME.modx_manager_log;"
Q6="TRUNCATE $DB_NAME.modx_event_log;"

SQL="${Q1}${Q2}${Q3}${Q4}${Q5}${Q6}"

mysql -uroot --password=$ROOTPASS -e "$SQL"


echo "database $DB_NAME set path and new admin pass $PASSWORD!"

#echo $Q1
#echo $Q2
#echo $Q3