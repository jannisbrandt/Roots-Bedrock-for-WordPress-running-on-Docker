#!/bin/bash

NOW=$(date +'%F-%H-%M-%S')
EXPORT_FILE=site/docker-export-$NOW.sql 

echo $EXPORT_FILE

docker exec -i $(docker-compose ps -q mysql) mysqldump -uwordpress -ppassword -hmysql wordpress --opt --quote-names --skip-set-charset | egrep -v "(^SET|^/\*\!)" > ${EXPORT_FILE}
