#!/usr/bin/env sh
mkdir -p /var/www/public/uploads
chmod -R 777 /var/www/public/uploads

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
