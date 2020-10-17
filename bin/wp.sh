#!/bin/bash

docker-compose exec --user www-data phpfpm wp --path='/var/www/html/web/wp' "$@"

