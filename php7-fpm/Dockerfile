FROM php:7.1-fpm

MAINTAINER Lukas Pstrowski <lukasz.pstrowski@gmail.com>

RUN apt-get update && apt-get install -y \
    git \
    wget \
    cron \
    unzip

# install mysqli extention
RUN docker-php-ext-install mysqli

# Type docker-php-ext-install to see available extensions
RUN docker-php-ext-install pdo pdo_mysql

# Set timezone
RUN rm /etc/localtime
RUN ln -s /usr/share/zoneinfo/Europe/Warsaw /etc/localtime
RUN "date"

# install xdebug
RUN pecl install xdebug
RUN docker-php-ext-enable xdebug

RUN usermod -u 1000 www-data

RUN mkdir /opt/application

# Setup Xdebug configuration
ADD ./scripts/xdebug_config.sh /opt/application
RUN chmod a+x /opt/application/xdebug_config.sh; sh /opt/application/xdebug_config.sh

# Install and verify composer
ADD ./scripts/composer_install.sh /opt/application
RUN chmod a+x /opt/application/composer_install.sh; sh /opt/application/composer_install.sh

ADD ./scripts/entrypoint.sh /opt/application

RUN chmod a+x /opt/application/entrypoint.sh

WORKDIR /var/www/symfony.dev

CMD ["/opt/application/entrypoint.sh"]

EXPOSE 9000