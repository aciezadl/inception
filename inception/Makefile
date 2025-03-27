NAME = inception
SRC = 
OBJETS = $(SRC:.cpp=.o)

CC = 

CLEANLINE=/33[2K

GREEN=/033[0;32m
BLUE=/033[0;34m
YELLOW=/033[0;33m
RED=/033[0;31m
NC=/033[0m

all: $(NAME)

$(NAME): $(OBJETS)
	@$(CC) $(OBJETS) -o &(NAME)
	@echo "$(GREEN)Compilation OK$(NC)"
	# sudo docker build -t img_nginx .
	# sudo docker run -p 8080:80 --name docker_nginx img_nginx

clean:
	@rm -f $(OBJETS)
	@echo "$(BLUE)Clean OK$(NC)"

fclean:
	@rm -f $(NAME)
	@rm -f $(OBJETS)
	@echo "$(BLUE)Clean OK$(NC)"

	# a configurer pour bien tout clean
	# docker rmi -f $(docker images -aq)
	# docker rm -f $(docker ps -aq)
	# docker system prune -a


re: fclean all

.PHONY: all clean fclean re
