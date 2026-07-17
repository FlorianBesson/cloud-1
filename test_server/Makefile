# if you don't have enough space in your home, you can define VAGRANT_HOME at .env
include ../subject/.env
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
	rm -rf ${VAGRANT_HOME}

re: clean set up

.PHONY: all up down clean fclean re
