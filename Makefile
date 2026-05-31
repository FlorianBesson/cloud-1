# if you don't have enough space in your home, you can define VAGRANT_HOME
VAGRANTHOME := $(VAGRANT_HOME)

all: up

up:
	vagrant up

down:
	vagrant halt

clean: down
	vagrant destroy -f
	rm -rf ./.vagrant
	rm -rf $(VAGRANTHOME)

re: clean up

.PHONY: all up down clean re