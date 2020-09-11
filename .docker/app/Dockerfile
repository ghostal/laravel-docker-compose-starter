FROM php:7.4-apache

ENV APACHE_RUN_USER devuser
ENV APACHE_RUN_GROUP devuser

# Based on the suggestion here: https://github.com/docker-library/php/issues/14#issuecomment-73153890
RUN adduser --uid 1000 --gecos 'My Apache User' --disabled-password devuser \
             && chown -R "$APACHE_RUN_USER:$APACHE_RUN_GROUP" /var/lock/apache2 /var/run/apache2

RUN a2enmod rewrite negotiation ssl

COPY php/php.ini /usr/local/etc/php/

COPY apache/vhost.conf /etc/apache2/sites-available/000-default.conf

COPY php/xdebug-dev.ini /usr/local/etc/php/conf.d/xdebug-dev.ini

RUN set -eux; apt-get update; apt-get install -y unzip; rm -rf /var/lib/apt/lists/*

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN chown -R www-data:www-data /var/www/html

# https://github.com/mlocati/docker-php-extension-installer
ADD https://raw.githubusercontent.com/mlocati/docker-php-extension-installer/master/install-php-extensions /usr/local/bin/
RUN chmod uga+x /usr/local/bin/install-php-extensions && sync && \
    install-php-extensions pdo_mysql zip xdebug redis
