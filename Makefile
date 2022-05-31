SRC := srcs/

all: build up

build: 
	cd $(SRC) && sudo docker-compose build

up: 
	sudo mkdir -p /home/jbosquet/data/mysql
	sudo mkdir -p /home/jbosquet/data/wordpress
	cd ${SRC} && sudo docker-compose up -d

start: 
	cd ${SRC} && sudo docker-compose start

stop:
	cd ${SRC} && sudo docker-compose stop

down: 
	cd ${SRC} && sudo docker-compose down

clear: 
	cd ${SRC} && sudo docker-compose down
	sudo rm -rf /home/jbosquet/data/mysql
	sudo rm -rf /home/jbosquet/data/wordpress

re: down build up

.PHONY: all build up start stop down clear re
