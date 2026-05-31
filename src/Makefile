# remove logs. podman is instead of docker and 42 most likely use it
export PODMAN_COMPOSE_WARNING_LOGS=false

all: up

up:
	docker compose up --build -d

down:
	docker compose down

clean:
	docker compose down --rmi all -v

ls:
	docker compose ps

re: clean up

.PHONY: all up down clean re
