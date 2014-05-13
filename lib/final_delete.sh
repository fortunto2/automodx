#!/bin/bash
#удаление после установки

#whiptail --yesno "Did you already know whiptail?" --yes-button "Yes, I did" --no-button "No, never heard of it"  10 70
#  	CHOICEs=$?
#	echo $CHOICEs

echo "---------------------------------------------------------" 
echo "------>GO and INSTALL UPDATE /install <------------------" 
echo "---------------------------------------------------------" 
echo "!---------------DELETE INSTALL ???----------------------!" 
echo "press (y) to delete /install after installations" 
read y_delete

if [ "$y_delete" == "y" ];
then
	echo "DELETE /install"
	find $PATHNEW/install -delete
	chmod -R 644 $PATHNEW/manager/includes/config.inc.php
else
	echo "OK dont delete"
fi

find $PATHNEW/assets/cache -name "docid*.php" -delete
