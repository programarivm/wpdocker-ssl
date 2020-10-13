FROM php:7.4-fpm

RUN apt-get update && apt-get install

RUN docker-php-ext-install mysqli pdo_mysql

RUN pecl install mailparse
