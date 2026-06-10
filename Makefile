.PHONY: init up down restart migrate fresh status logs shell test clear-cache test-post test-redirect test-stats

SAIL = ./vendor/bin/sail
URL_BASE = http://localhost

init:
	
	cp -n .env.example .env || true
	composer install
	$(SAIL) up -d
	$(SAIL) artisan key:generate
	$(SAIL) artisan migrate

up:
	$(SAIL) up -d

down:
	$(SAIL) down

restart: down up

migrate:
	$(SAIL) artisan migrate

fresh:
	$(SAIL) artisan migrate:fresh

test:
	$(SAIL) artisan test

clear-cache:
	$(SAIL) artisan route:clear
	$(SAIL) artisan config:clear

create-test:
	@curl -s -X POST $(URL_BASE)/api/links -H "Content-Type: application/json" -H "Accept: application/json" -d '{"url": "https://google.com"}' | grep -o '"code":"[^"]*' | grep -o '[^"]*$$' > .short-url
	@echo "Короткая ссылка: $$(cat .short-url)"
	@echo ""

redirect-test:
	@echo "Проверка редиректа:"
	@curl -I -H "Accept: application/json" $(URL_BASE)/$$(cat .short-url)

stats-test:
	@echo "Cтатистики кликов:"
	@curl -X GET $(URL_BASE)/api/links/$$(cat .short-url)/stats -H "Accept: application/json"
	@echo "\n"