#!/bin/bash

pv $1 | docker exec -i $(docker-compose ps -q mysql) mysql -uwordpress -ppassword --default-character-set=utf8 wordpress 
