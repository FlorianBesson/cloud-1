include .env
export

all: set up

set:
	mkdir -p ${MARIADB_VOLUME_PATH}
	mkdir -p ${WORDPRESS_VOLUME_PATH}
	mkdir -p ${PHPMYADMIN_VOLUME_PATH}

up:
	docker compose up --build -d

down:
	docker compose down

clean:
	docker compose down --rmi all -v
	sudo rm -rf ${VOLUME_PATH}

ls:
	docker compose ps

re: clean set up

.PHONY: all up down clean re
