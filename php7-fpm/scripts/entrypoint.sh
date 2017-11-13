#!/usr/bin/env bash

# change ownership and permissions for symfony cache directory
chown -R www-data:www-data /var/www/symfony.dev/var
chmod 755 /var/www/symfony.dev/var

# clear caches symfony 3.*
/var/www/symfony.dev/bin/console cache:clear --no-warmup

# keep PHP-FPM process as a main process
php-fpm -F