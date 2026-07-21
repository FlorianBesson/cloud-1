# if you don't have enough space in your home, you can define VAGRANT_HOME at .env
include ./.env
export

<<<<<<< Updated upstream
=======
ENV_FILE		:= .env
ENV_EXAMPLE		:= .env.example
SRC_ENV_FILE	:= src/.env
SRC_ENV_EXAMPLE	:= src/.env.example
HOSTS_FILE		:= ansible/hosts.ini
HOSTS_EXAMPLE	:= ansible/hosts.ini.example
TEST_PATH		:= ../test_server

>>>>>>> Stashed changes
all: set up

set:
	mkdir -p ${VAGRANT_HOME}
	mkdir -p ${VBOX_VM_PATH}

up:
	vagrant up

down:
	vagrant halt

clean: down
	vagrant destroy -f
	rm -rf ./.vagrant

fclean: clean
	rm -rf ${VAGRANT_HOME}

re: clean set up

.PHONY: all up down clean fclean re
