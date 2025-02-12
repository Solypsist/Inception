theft:
	@docker compose -f ./srcs/docker-compose.yaml up --build

all:
	@docker compose -f ./srcs/docker-compose.yml up --build

detach:
	@docker compose -f ./srcs/docker-compose.yml up --build -d


down:
	@docker compose -f ./srcs/docker-compose.yml down --rmi all --remove-orphans	

# re:
# 	@docker compose -f srcs/docker-compose.yml up --build

clean:
	@docker stop $$(docker ps -qa) 2>/dev/null || true;
	@docker rm $$(docker ps -qa) 2>/dev/null || true;
	@docker rmi -f $$(docker images -qa) 2>/dev/null || true;
	@docker volume rm $$(docker volume ls -q) 2>/dev/null || true;
	@docker network rm $$(docker network ls -q) 2>/dev/null || true;

fclean: clean
	@docker system  prune -af
	@docker volume  prune -af
	@docker network prune -f

# .PHONY: all re clean fclean run
.PHONY: all down clean
.DEFAULT_GOAL:= all

# docker exec -it nginx bash