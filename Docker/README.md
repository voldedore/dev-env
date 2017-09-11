# Docker-based development environment

Personal place to store docker based dev env configurations.

Images used:

* nginx:1.12-alpine
* php:5.6-fpm-alpine
* php:7.1-fpm-alpine
* mariadb:latest

## Containers details

This work provides both php5.6 and php7, combined with nginx 1.12, and mariadb latest stable version.

### Ports

* Access PHP5 via port 5555
* Access PHP7 via port 7777
* MariaDB via 3306

Of course you can change these ports to what you want in Docker/docker-compose.yml file.

### MariaDB User Config

* Username: mkd
* Password: password
* Root: root|password
* Default database name: mkgdb

And you can also customize these credentials in the said yml file.


## Pre-requirements

1. Installed Docker, docker-compose.

  Please follow the documentations to install it correctly.
2. Thinking...

## Instructions

1. Clone the repo.

  ```
  git clone https://github.com/voldedore/dev-env.git
  ```

2. (Optional) Copy database dump file(s) to Docker/db directory. E.g: db/magento_sample_data_for_1.sql

3. Build containers.

  ```
  cd Docker
  docker-compose build
  ```

4. Start containers

  ```
  docker-compose up -d
  ```
