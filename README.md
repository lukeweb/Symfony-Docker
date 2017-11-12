Docker Symfony (PHP7-FPM - NGINX - MySQL)
=========================================

[![Build Status](https://travis-ci.org/lukeweb/Symfony-Docker.svg?branch=master)](https://travis-ci.org/lukeweb/Symfony-Docker)

Very Basic version of integration Symfony 3.* with docker containers for local development.
I'll be adding new features along the way. You'll able find them on branch `develop`. Feel free to modify it to 
your needs. Enjoy.

## Installation

First create and configure your `.env` file. On Linux or Mac OS X use.
```bash
    cp .env.dist .env
```

Then download Symfony 3.* and update `.env` path to your project.
Next step is to build your containers.
```bash
    docker-compose build
    docker-compose up -d
```
You can access Symfony page under `0.0.0.0:8080` or you can update your `hosts` file adding `symfony.dev`.

**NOTE:** Nginx was configured to read file `app_dev.php` in `web` directory. That meas when you'll try access
Symfony page you should get code `403`. Problem can be solved in two ways.

>Change nginx configuration to read `app.php`. (You won't be able to access profiler) or edit `app_dev.php` file by commenting out security section
 or adding to array IP address of docker container. 
 

