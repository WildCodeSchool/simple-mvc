#!/usr/bin/env sh
set -e

composer install \
    --ignore-platform-reqs \
    --no-interaction \
    --no-plugins \
    --no-scripts \
    --prefer-dist \
    --quiet

php /var/www/migration.php


php-fpm -D
nginx -g 'daemon off;'
