.PHONY: init up down restart migrate fresh status logs shell test

init:
	cp -n .env.example .env || true
	composer install
	./vendor/bin/sail up -d
	./vendor/bin/sail artisan key:generate
	./vendor/bin/sail artisan migrate

up:
	./vendor/bin/sail up -d

down:
	./vendor/bin/sail down

restart: down up

migrate:
	./vendor/bin/sail artisan migrate

fresh:
	./vendor/bin/sail artisan migrate:fresh

status:
	docker ps

logs:
	./vendor/bin/sail logs -f

shell:
	./vendor/bin/sail shell

test:
	./vendor/bin/sail artisan test
