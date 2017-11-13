#!/bin/sh

echo "**** Setting up Xdebug configuration ****"

if [ ! -f /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini ]; then
    echo "**** Xdebug config file not found! ****"
    exit 1
fi

echo "error_reporting = E_ALL" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
echo "display_startup_errors = On" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
echo "display_errors = On" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
echo "xdebug.remote_enable=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
echo "xdebug.remote_connect_back=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
echo "xdebug.idekey=\"PHPSTORM\"" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
echo "xdebug.remote_port=9001" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

RESULT=$?

echo "**** Finished setup ****"

exit ${RESULT}