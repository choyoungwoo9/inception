DOCKER_COMPOSE_FILE = ./srcs/docker-compose.yml

up:
	docker compose -f $(DOCKER_COMPOSE_FILE) up -d

down:
	docker compose -f $(DOCKER_COMPOSE_FILE) down

build:
	docker compose -f $(DOCKER_COMPOSE_FILE) build

prune:
	docker system prune -af

all: build up

clean: down

fclean: clean prune

re: fclean all

.PHONY: bonus all clean fclean re up down build prune