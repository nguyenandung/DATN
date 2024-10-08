FROM php:8.2-fpm

#Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y openssh-server apache2 supervisor
RUN pecl install apcu-5.1.20 && docker-php-ext-enable apcu

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd
# RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
#     && docker-php-ext-install -j$(nproc) gd \
#     && docker-php-ext-install pdo pdo_mysql zip exif pcntl

RUN apt-get update

WORKDIR /var/www

ENV COMPOSER_ALLOW_SUPERUSER=1
RUN set -eux;

COPY . /var/www/
COPY ./php/supervisor/laravel-worker.conf /etc/supervisor/conf.d/laravel-worker.conf
COPY ./php/start.sh /usr/local/bin/start

RUN mkdir -p /var/log/supervisor

# RUN curl -sL https://deb.nodesource.com/setup_20.x | bash -
# RUN apt-get install -y nodejs
# RUN cd /var/www && npm install

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Sao chép file cấu hình của Supervisor vào container
# COPY supervisor.conf /etc/supervisor/conf.d/supervisor.conf

RUN chown -R www-data:www-data /var/www \
    && chmod u+x /usr/local/bin/start \
    && a2enmod rewrite
# RUN pecl install redis && \
#     docker-php-ext-enable redis

RUN chmod +x /usr/local/bin/start

RUN cd /var/www && composer update --ignore-platform-req=ext-gd --ignore-platform-req=ext-zip
# RUN cd /var/www && php artisan key:generate && php artisan config:cache && php artisan config:clear && php artisan migrate
# RUN cd /var/www && php artisan migrate

CMD ["/usr/local/bin/start"]
