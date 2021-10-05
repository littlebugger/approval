#!/bin/sh

docker run -d \
	 --network test-app --network-alias mysql \
	 -v mysql-data:/var/lib/mysql \
	 -e MYSQL_ROOT_PASSWORD=secret \
	 -e MYSQL_DATABASE=stuff_mail \
	 mysql:5.7

# docker run --name mysql_dev -e MYSQL_ROOT_PASSWORD=root -d mysql:5.7

# docker create --name live3_dev \
# 	--link mysql_dev:mysql \
# 		 -v `pwd`:/app \
# 		 -v `pwd`/carmel_cache:/root/.carmel \
# 		 -p 3010:3000 \
# 		 -w /app \
# 		 ship.kinoplan24.ru/perl:5.22.2 \
# 		 bin/start_dev

# docker start live3_dev
