start:
	docker compose -f ./docker/docker-compose.yml -f ./docker/docker-compose.start.yml -p my_project up -d --build

dev:
	docker compose -f ./docker/docker-compose.yml -f ./docker/docker-compose.dev.yml -p my_project up -d --build

prod:
	docker compose -f ./docker/docker-compose.yml -f ./docker/docker-compose.prod.yml -p my_project up -d --build

prod_static:
	docker compose -f ./docker/docker-compose.yml -f ./docker/docker-compose.prod_static.yml -p my_project up -d --build

build:
	# "ENOTIMPLEMENTEDYET: This should be configured according to your needs."
	# docker build <???> . 

stop:
	docker compose -f ./docker/docker-compose.yml -p my_project down -v