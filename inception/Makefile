NAME = inception

CLEANLINE=/33[2K

GREEN=/033[0;32m
BLUE=/033[0;34m
YELLOW=/033[0;33m
RED=/033[0;31m
NC=/033[0m

all:
	cd srcs/ && docker compose up -d --build

down:
	cd srcs/ && docker compose down
	@echo "$(BLUE)Containers are down$(NC)"

clean:
	# a configurer pour bien tout clean
	cd srcs/ && docker rmi -f $(docker images -aq)
	cd srcs/ && docker rm -f $(docker ps -aq)
	cd srcs/ && docker system prune -a
	@echo "$(BLUE)Clean OK$(NC)"

re: fclean all

.PHONY: all clean fclean re
