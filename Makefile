# if you don't have enough space in your home, you can define VAGRANT_HOME at .env
include ./src/.env
export

all: set up

set:
	mkdir -p ${VAGRANT_HOME}
	mkdir -p ${MARIADB_VOLUME_PATH}
	mkdir -p ${WORDPRESS_VOLUME_PATH}

up:
	vagrant up

down:
	vagrant halt

clean: down
	vagrant destroy -f
	rm -rf ./.vagrant
	rm -rf ${VAGRANT_HOME}
	rm -rf ${VOLUME_PATH}

re: clean up

.PHONY: all up down clean re
