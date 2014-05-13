automodx
========

Bash script to autointall Modx Evo in server (with ispmanager panel) 
Скрипт автоустановки (обновления) MODX Evo на сервере через консоль ssh.
Используется api ispmanager lite

Скрипт берет по умолчанию устновленный modx на каком либо домене (у меня pevm.ru) и позволяет его скопировать на новый домен.
Причем в панеле надо сперва создать пользователя и www domen.

Затем запускать скрипт **modx.sh -a vash-domen-kuda-stavit.ru**


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
**automodx / lib / pass.sh** 


также настроить, откуда копировать modx - источник
в скрипте **modx_add_pevm.sh**, заменитье домен pevm.ru на ваш, и путь к сайту образцу


****
Тема с описанием http://modx.im/blog/research/476.html

Видео презентация
http://www.youtube.com/watch?v=5EyRyv6zd1M

****
По вопросам установки пишите на info@3dstr.ru
