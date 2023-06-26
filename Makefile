start_latest:
	docker compose -f ./docker/docker-compose.yml -f ./docker/docker-compose.start.yml -p my_project up -d --no-build --pull always
	docker rmi $$(docker images -f "dangling=true" -q)

start_local:
	docker compose -f ./docker/docker-compose.yml -f ./docker/docker-compose.start.yml -p my_project up -d --build
	docker rmi $$(docker images -f "dangling=true" -q)

dev:
	docker compose -f ./docker/docker-compose.yml -f ./docker/docker-compose.dev.yml -p my_project up -d --build
	docker rmi $$(docker images -f "dangling=true" -q)

prod:
	docker compose -f ./docker/docker-compose.yml -f ./docker/docker-compose.prod.yml -p my_project up -d --build
	docker rmi $$(docker images -f "dangling=true" -q)

prod_static:
	docker compose -f ./docker/docker-compose.yml -f ./docker/docker-compose.prod_static.yml -p my_project up -d --build
	docker rmi $$(docker images -f "dangling=true" -q)

build:
	# "ENOTIMPLEMENTEDYET: This should be configured according to your needs."
	# docker build <???> . 

stop:
	docker compose -f ./docker/docker-compose.yml -p my_project down -v
	docker rmi $$(docker images -f "dangling=true" -q)

cleanup:
	docker rmi $$(docker images -f "dangling=true" -q)