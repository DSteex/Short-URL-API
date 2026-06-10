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

## Управление контейнерами

- make up - запустить контейнеры
- make down - остановить контейнеры
- make restart - перезапустить контейнеры
- make migrate - миграции
- make fresh - пересоздать бд (migrate:fresh)
- make clear-cache - очистка маршртутов и конфигурации laravel

## Примеры проверки URL

### 1. Создание short_url 

- make create-test

### 2. Редирект по short_url

- make redirect-test

### 3. Статистика переходов

- make stat-test