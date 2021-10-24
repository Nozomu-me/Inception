

up: build
	cd srcs && docker-compose up

build:
	cd srcs && docker-compose build

down:
	cd srcs && docker-compose down

re: down up