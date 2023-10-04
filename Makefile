name = inception
all:
	@bash srcs/requirements/wordpress/tools/make_dir.sh
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d

build:
	@bash srcs/requirements/wordpress/tools/make_dir.sh
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

down:
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env down

re: down
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

clean:
	@docker system prune -a

fclean:
	@docker stop $$(docker ps -qa)
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force

clean_data:
	@sudo rm -rf ~/data/wordpress/*
	@sudo rm -rf ~/data/mariadb/*

.PHONY	: all build down re clean fclean clean_data
