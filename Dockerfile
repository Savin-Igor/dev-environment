FROM php:8.1-fpm

# Install system dependencies
RUN apt-get update; \
    apt-get -y --no-install-recommends install \
        git \
        curl \
        php8.1-bz2 \
        php8.1-intl \
        php8.1-mcrypt \
        php8.1-memcache \
        php8.1-memcached \
        php8.1-mysql \
        php8.1-psr \
        php8.1-soap \
        php8.1-uuid \
        php8.1-xdebug \
        php8.1-yaml; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www
