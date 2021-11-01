

up: build
	cd srcs && docker-compose up

build:
	
	cd srcs && docker-compose build

down:
	cd srcs && docker-compose down

re: down up

clear:
	sudo rm -rf ~/data/mariadb-volume/*
	sudo rm -rf ~/data/wp-volume/*
