FROM yiisoftware/yii2-php:7.3-apache

# Set on-build env values
ARG buildtime_workdir="/app"
ARG buildtime_apcu_version=5.1.11
ENV APP_WORKDIR=${buildtime_workdir}
ENV APCU_VERSION=${buildtime_apcu_version}

# Install selected extensions and other stuff
RUN pecl install apcu-${APCU_VERSION} && docker-php-ext-enable apcu \
    && echo "apc.enable_cli=1" >> /usr/local/etc/php/php.ini \
    && echo "apc.enable=1" >> /usr/local/etc/php/php.ini

# Set working directory
WORKDIR ${APP_WORKDIR}