FROM php:8.5-fpm-alpine

# uid/gid владельца файлов проекта на хосте.
# Значения приходят из docker-compose.yaml (HOST_UID/HOST_GID, по умолчанию 1000:1000),
# чтобы php-fpm создавал storage/logs, compiled views и кеш сразу от вашего пользователя.
ARG UID=1000
ARG GID=1000

WORKDIR /var/www/laravel

RUN docker-php-ext-install pdo pdo_mysql \
    && addgroup -g ${GID} laravel \
    && adduser -D -H -u ${UID} -G laravel laravel \
    && sed -i "s/^user = www-data/user = laravel/; s/^group = www-data/group = laravel/" /usr/local/etc/php-fpm.d/www.conf
