DOCKER_COMPOSE_FILE = ./srcs/docker-compose.yml

up:
	docker-compose -f $(DOCKER_COMPOSE_FILE) up -d

build:
	docker-compose -f $(DOCKER_COMPOSE_FILE) build

down:
	docker-compose -f $(DOCKER_COMPOSE_FILE) down

logs:
	docker-compose -f $(DOCKER_COMPOSE_FILE) logs