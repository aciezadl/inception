all:
	cd /home/aciezadl/ && mkdir -p data
	cd /home/aciezadl/data && mkdir -p wordpress_data
	cd /home/aciezadl/data && mkdir -p mariadb_data
	cd srcs/ && docker compose up -d --build

down:
	cd srcs/ && docker compose down
	@echo "Containers are down"

clean:
	cd srcs/ && docker rmi -f $$(docker images -aq)
	cd srcs/ && docker rm -f $$(docker ps -aq)
	@echo "Clean OK"

fclean:
	cd srcs/ && docker volume rm $$(docker volume ls -q)
	cd srcs/ && docker system prune -a
	rm -rf /home/aciezadl/data
	@echo "fclean OK"

.PHONY: all down clean fclean