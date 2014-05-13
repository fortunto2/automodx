automodx
========

Bash script to autointall Modx Evo in server (with ispmanager panel) 
Скрипт автоустановки (обновления) MODX Evo на сервере через консоль ssh.
Используется api ispmanager lite

Запускать надо *modx.sh* 
Для удобства сделайте симлинк на него, в папку /usr/local/bin например

=====

Дополнительно лежат скрипты

*arhiv.sh* - для архивирования не нужных проектов (через ispmanager удаляется www домен, и архивируются база и файлы в нужную папку)

*delete.sh* - удаление из панели

*get_git_dmi3y.sh*  - скачать последнию версию modx от dmi3y

*****
Настройка:
надо указать root пароль от mysql базы в файле
automodx / lib / pass.sh 
