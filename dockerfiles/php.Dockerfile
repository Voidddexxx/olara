FROM php:8.5-fpm-alpine
WORKDIR /var/www/laravel
RUN docker-php-ext-install pdo pdo_mysql