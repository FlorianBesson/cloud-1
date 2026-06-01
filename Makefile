# if you don't have enough space in your home, you can define VAGRANT_HOME at .env

all: set up

set:
	@set -a && source ./src/.env && set +a && \
	mkdir -p $${VAGRANT_HOME} && \

up:
	vagrant up

down:
	vagrant halt

clean: down
	vagrant destroy -f
	rm -rf ./.vagrant
	rm -rf $${VAGRANT_HOME}

re: clean up

.PHONY: all up down clean re