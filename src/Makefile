include .env
export

all: set up

set:
	mkdir -p ${VOLUME_MARIADB}
	mkdir -p ${VOLUME_WORDPRESS}
	mkdir -p ${VOLUME_PHPMYADMIN}

up:
	docker compose up --build -d

down:
	docker compose down

clean:
	docker compose down --rmi all -v
	sudo rm -rf ${VOLUME}

ls:
	docker compose ps

re: clean set up

.PHONY: all up down clean re
