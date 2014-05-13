#!/bin/bash
#для установки из папки со сборкой дмитрия

echo "!!! NEW SITE FROM Dmi3y folder!!!!"

source ./lib/pass.sh  //подключаем файлы паролей
source ./lib/input.sh  //подключаем ввод

PATHOLD="./modx.evo.custom-master"
echo "Copy from :" $PATHOLD

echo "!---------------Coping to new----------------------!" 

find $PATHNEW" -type f -exec rm -rf {} \;

cp -R $PATHOLD/* $PATHNEW/
cp $PATHOLD/.htaccess $PATHNEW/

#cp ./lib/config.inc.php $PATHNEW/manager/includes/

echo "copy done!"


DB_DROP="0"

source ./lib/db_create_isp.sh  //создание новой базы

echo "---------------CHMOD -----------------------"

source ./lib/files_chmod.sh  //обновление прав

#source ./lib/update_config.sh  //замена в файле конфиге модекса

source ./lib/print.sh  //вывод инфы

source ./lib/final_delete.sh  //удаление инстала после установки

#source ./lib/db_set.sh  //задание параметров в базе




