
CMD		= docker compose -f srcs/docker-compose.yml --env-file srcs/.env
GRN     = \033[1;32m
YEL     = \033[1;33m
RED     = \033[1;31m
RST     = \033[0m

all: build
	@echo "$(GRN)Starting Containers...$(RST)"

build:
	@echo "$(YEL)Building Volumes...$(RST)"
	@mkdir -p /home/bn-bn/data/db /home/bn-bn/data/wordpress
	@echo "$(YEL)Building Images...$(RST)"
	@$(CMD) up --build -d

stop:
	@echo "$(RED)Stopping Containers...$(RST)"
	@$(CMD) stop

start:
	@echo "$(GRN)Starting Containers...$(RST)"
	@$(CMD) start

down:
	@echo "$(RED)Remove containers and networks...$(RST)"
	@$(CMD) down

clean: down
	@echo "$(RED)Cleaning images...$(RST)"
	@docker system prune -a -f

fclean: clean
	@echo "$(RED)Cleaning Data volumes...$(RST)"
	@sudo rm -rf /home/bn-bn/data
	@$(CMD) down -v

re: fclean all