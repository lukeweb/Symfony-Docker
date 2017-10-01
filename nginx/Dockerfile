FROM debian:jessie

RUN apt-get update && apt-get install -y \
    nginx

ADD nginx.conf /etc/nginx/
# config for development -> reads app_dev.php
ADD symfony.dev  /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/symfony.dev /etc/nginx/sites-enabled/

# add cofig for production -> reads app.php
# ADD symfony.prod  /etc/nginx/sites-available/
# RUN ln -s /etc/nginx/sites-available/symfony.prod /etc/nginx/sites-enabled/

RUN rm /etc/nginx/sites-enabled/default

RUN usermod -u 1000 www-data

CMD ["nginx"]

EXPOSE 80
EXPOSE 443