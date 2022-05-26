SRC := srcs/

build: 
	cd $(SRC) && sudo docker-compose build

up: 
	mkdir -p /home/jbosquet/data/mysql
	mkdir -p /home/jbosquet/data/wordpress
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

.PHONY: build up start stop down clearall re
