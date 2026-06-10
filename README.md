## Технический стек
- PHP 8.+
- Laravel 11
- PostgreSQL
- Docker (Laravel Sail)

## Развертывание проекта

Для быстрой сборки и запуска проекта используется Makefile.

Инициализация и первый запуск проекта:

- make init

## Примеры проверки URL
### 1. Создание short_url 

- make create-test

### 2. Редирект по short_url

- make redirect-test

### 3. Статистика переходов

- make stat-test

## Управление контейнерами

- make up - запустить контейнеры
- make down - остановить контейнеры
- make restart - перезапустить контейнеры
- make migrate - миграции
- make fresh - пересоздать бд (migrate:fresh)
- make clear-cache - очистка маршртутов и конфигурации laravel