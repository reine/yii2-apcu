FROM yiisoftware/yii2-php:7.3-apache

# Set on-build env values
ARG APCU_VERSION=5.1.12

# Install selected extensions and other stuff
RUN pecl install apcu-${APCU_VERSION} && docker-php-ext-enable apcu \
    && echo "apc.enable_cli=1" >> /usr/local/etc/php/php.ini \
    && echo "apc.enable=1" >> /usr/local/etc/php/php.ini