
cmd = docker compose -f srcs/docker-compose.yml --env-file srcs/.env

GREEN       = \033[1;32m
YELLOW      = \033[1;33m
RED         = \033[1;31m
RESET       = \033[0m

all: build
	@echo "$(GREEN)Starting Containers...$(RESET)"

build:
	@echo "$(YELLOW)Building Volumes...$(RESET)"
	@mkdir -p /home/bn-bn/data/db /home/bn-bn/data/wordpress
	@echo "$(YELLOW)Building Images...$(RESET)"
	@$(cmd) up --build -d

stop:
	@echo "$(RED)Stopping Containers...$(RESET)"
	@$(cmd) down

clean: stop
	@echo "$(RED)Cleaning Docker images...$(RESET)"
	@docker system prune -a -f

fclean: clean
	@echo "$(RED)Removing Volumes...$(RESET)"
	@rm -rf /home/bn-bn/data
	@$(cmd) down -v

re: fclean all

