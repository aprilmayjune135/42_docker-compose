# color setting
RESET = \033[0;0m
MAGENTA = \033[1;35m\033[47m

PROJECT = inception
CONTAINERS = nginx db wordpress
SERVICES = nginx db wordpress
IMAGES = $(addprefix $(PROJECT)_, $(SERVICES))

all:
	@echo "$(MAGENTA)start docker-compose...$(RESET)"
	docker-compose -f ./srcs/docker-compose.yml up -d

start:
	@echo "$(MAGENTA)start all containers...$(RESET)"
	docker start $(CONTAINERS)

stop:
	@echo "$(MAGENTA)stop all containers...$(RESET)"
	docker stop $(CONTAINERS)

clean:
	@echo "$(MAGENTA)remove all containers/images/volumes...$(RESET)"
	docker-compose -f ./srcs/docker-compose.yml down --rmi all --volumes
#rm -rf ./data/db/* ./data/wordpress/*

fclean: clean

re: fclean all

.PHONY: all clean fclean re stop
