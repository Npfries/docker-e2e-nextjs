This repo is intended to demonstrate the end to end lifecycle of a Next.js application with Docker.

There are several Docker commands in the Makefile for convenient use of the project. 
```
make start

// docker compose -f ./docker/docker-compose.yml -f ./docker/docker-compose.start.yml -p my_project up -d --build
```

```
make dev

// docker compose -f ./docker/docker-compose.yml -f ./docker/docker-compose.dev.yml -p my_project up -d --build
```

```
make prod

// docker compose -f ./docker/docker-compose.yml -f ./docker/docker-compose.prod.yml -p my_project up -d --build
```

```
make prod_static

// docker compose -f ./docker/docker-compose.yml -f ./docker/docker-compose.prod_static.yml -p my_project up -d --build
```

```
make build
```

```
make stop

// docker compose -f ./docker/docker-compose.yml -p my_project down -v
```