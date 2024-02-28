up:
	docker compose -f ./srcs/docker-compose.yml up -d

build:
	docker compose -f ./srcs/docker-compose.yml build

down:
	docker compose -f ./srcs/docker-compose.yml down

stop:
	docker compose -f ./srcs/docker-compose.yml stop

start:
	docker compose -f ./srcs/docker-compose.yml start

clean:
	docker compose -f ./srcs/docker-compose.yml down -v --remove-orphans
	docker system prune --all --volumes --force



status :
	docker compose ps

fclean: clean
	docker volume ls -q | grep database-data | xargs --no-run-if-empty docker volume rm
	docker volume ls -q | grep backend-source-code | xargs --no-run-if-empty docker volume rm


