#!/bin/bash
#генерация паролей и рут от базы

# MySQL root password
ROOTPASS="tut vash parol"
TIMEZONE="Europe/Moscow"

MYSQLPASS=`< /dev/urandom tr -dc A-Za-z0-9 | head -c12`
#SFTPPASS=`< /dev/urandom tr -dc A-Za-z0-9 | head -c12`
PASSWORD=`< /dev/urandom tr -dc A-Za-z0-9 | head -c8`
PASSWORD_USER=`< /dev/urandom tr -dc A-Za-z0-9 | head -c8`

DB_DROP="1"