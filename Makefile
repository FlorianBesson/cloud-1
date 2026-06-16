# if you don't have enough space in your home, you can define VAGRANT_HOME at .env
include ./src/.env
export

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
	rm -rf ${VBOX_VM_PATH}

re: fclean set up

.PHONY: all up down clean fclean re
