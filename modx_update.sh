#для обновления модекса, доступов к базе создаются юзер и пароли, для админки пароли новые

tput rev
echo "??? UPDATE modx, set new pass, chmod  ???"
tput sgr0

a1="pass.sh" ; source "$a1" ; if [ $? -ne 0 ] ; then echo "Error — no bashscripts $a1" 1>&2 ; exit 1 ; fi 
a1="input_param.sh" ; source "$a1" ; if [ $? -ne 0 ] ; then echo "Error — no bashscripts $a1" 1>&2 ; exit 1 ; fi 

#myAskYN "Ты уверен, что хочешь запустить это?" 

DB_NAME=$(echo $DOMAIN | sed -e 's/\.//g')
DB_NAME=$(echo $DB_NAME | sed -e 's/\-//g')
DB_NAME=$(echo $DB_NAME | cut -c1-15)

echo "New database name:" $DB_NAME
DB_USER=$DB_NAME
echo "New database user:" $DB_USER

a1="update_config.sh" ; source "$a1" ; if [ $? -ne 0 ] ; then echo "Error — no bashscripts $a1" 1>&2 ; exit 1 ; fi 
a1="db_create_isp.sh" ; source "$a1" ; if [ $? -ne 0 ] ; then echo "Error — no bashscripts $a1" 1>&2 ; exit 1 ; fi 
a1="db_set.sh" ; source "$a1" ; if [ $? -ne 0 ] ; then echo "Error — no bashscripts $a1" 1>&2 ; exit 1 ; fi 
a1="files_update_modx108.sh" ; source "$a1" ; if [ $? -ne 0 ] ; then echo "Error — no bashscripts $a1" 1>&2 ; exit 1 ; fi 
a1="files_chmod.sh" ; source "$a1" ; if [ $? -ne 0 ] ; then echo "Error — no bashscripts $a1" 1>&2 ; exit 1 ; fi 
a1="print.sh" ; source "$a1" ; if [ $? -ne 0 ] ; then echo "Error — no bashscripts $a1" 1>&2 ; exit 1 ; fi 
a1="final_delete.sh" ; source "$a1" ; if [ $? -ne 0 ] ; then echo "Error — no bashscripts $a1" 1>&2 ; exit 1 ; fi 

#source update_config.sh  //замена в файле конфиге модекса

#source db_create_isp.sh  //создание новой базы

#source db_set.sh  //задание параметров в базе

#source files_update_modx108.sh  //копирование нового модекса

#source files_chmod.sh  //обновление прав

#source print.sh  //вывод инфы

#source final_delete.sh  //удаление инстала после установки