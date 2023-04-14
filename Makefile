NAME	:= Inception
YML	:= srcs/docker-compose.yml

all: $(NAME)

$(NAME):
	sudo mkdir -p /home/florian/data/wordpress
	sudo mkdir -p /home/florian/data/mariadb
	docker compose -f $(YML) up --build -d

stop:
	docker compose -f $(YML) down

clean:
	- docker container stop $$(docker container ps -aq)
	- docker container rm $$(docker container ps -aq)
	- docker image rm -f $$(docker image ls -aq)
	- docker volume rm $$(docker volume ls -q)
	- docker network rm $$(docker network ls -q)

fclean: clean volume

prune:
	docker system prune --all --volumes

volume:
	sudo rm -rf /home/florian/data/wordpress
	sudo rm -rf /home/florian/data/mariadb
	mkdir -p /home/florian/data/wordpress
	mkdir -p /home/florian/data/mariadb
	
domain:	bash -c 'echo "127.0.0.1 fsemke.42.fr" >> /etc/hosts'

logs: 
	docker compose -f $(YML) logs

re:	prune volume