all:
	cd /home/aciezadl/ && mkdir -p data
	cd /home/aciezadl/data && mkdir -p wordpress_data
	cd /home/aciezadl/data && mkdir -p mariadb_data
	cd srcs/ && docker compose up -d --build

stop:
	cd srcs/ && docker compose stop
	@echo "--- Containers stopped ---"

down:
	cd srcs/ && docker compose down
	@echo "--- Containers stopped and removed ---"

clean:
	cd srcs/ && docker rmi -f $$(docker images -aq)
	cd srcs/ && docker rm -f $$(docker ps -aq)
	@echo "--- images and containers removed ---"

fclean:
	cd srcs/ && docker volume rm $$(docker volume ls -q)
	cd srcs/ && docker system prune -a
	@echo "fclean OK"

rmdata:
	rm -rf /home/aciezadl/data
	@echo "Local folder data removed"

.PHONY: all stop down clean fclean rmdata