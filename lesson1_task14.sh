#!/bin/bash

USER=user
HOST=ip_address

#generic file
FILE=/var/log/$( date '+%d-%m-%Y' ).log
echo "today $(date '+%d-%m-%Y')" > $FILE

#push file to another machine
scp $FILE $USER@$HOST:/home/$USER

#delete file
#Если файлы никто не будет изменять, то можно использовать команду ниже
ssh $USER@$HOST "find -name "*.log" /home/$USER -atime +7 -delete"

#Если файлы будут изменять (даже случайно), то тогда можно удалять старые по имени файла (брать за дату имя файла)
#Но он не будет удалять файлы старше одной недели, ибо их и не будет оставаться (каждый день загружает и удаляет файл)
ssh $USER@$HOST "rm -f /home/$USER/'$(date '+%d-%m-%Y' -d last-week)'"

#в кроне прописать: 0 12 * * *   root    /home/user/script.sh
#я выбрала запуск в полдень каждый день, так как если у ssh не будет ключей, пароль придётся вводить самим
#скрипт нужно запускать от рута
