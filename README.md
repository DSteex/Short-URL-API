## Технический стек
- PHP 8.x
- Laravel 11
- PostgreSQL
- Docker (Laravel Sail)

## Развертывание проекта

Для быстрой сборки и запуска проекта используется Makefile. Выполните в терминале Ubuntu:

1. Инициализация и первый запуск проекта:
make init

2. Проверить статус контейнеров:
make status

Проект будет доступен локально по адресу: `http://localhost` (порт 80).

## Команды 
- make up — запустить контейнеры
- make down — остановить контейнеры
- make restart — перезапустить контейнеры
- make fresh — пересоздать базу данных с нуля (migrate:fresh)
- make logs — просмотр логов Docker в реальном времени

## Методы и примеры проверки URL

### 1. Создание short_url 

- curl -X POST http://localhost/api/links -H "Content-Type: application/json" -H "Accept: application/json" -d '{"url": "https://google.com"}'

### 2. Редирект по short_url

- curl -I http://localhost/Fq6WJq

### 3. Статистика переходов

- curl -X GET http://localhost/api/links/Fq6WJq/stats -H "Accept: application/json"