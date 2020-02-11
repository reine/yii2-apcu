FROM yiisoftware/yii2-php:7.3-apache

# Set on-build env values
ARG APCU_VERSION=5.1.17

# Install selected extensions and other stuff
RUN pecl install apcu-${APCU_VERSION} && docker-php-ext-enable apcu \
    && echo "apc.enable_cli=1" >> /usr/local/etc/php/php.ini \
    && echo "apc.enable=1" >> /usr/local/etc/php/php.ini

RUN apt-get update \
    && apt-get -y install php-imap \
    && docker-php-ext-enable imap \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*
