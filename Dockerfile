FROM php:7.4.18-apache-buster

EXPOSE 80

RUN apt-get update \
  && apt-get -y install libfreetype6-dev libjpeg62-turbo-dev libpng-dev libwebp-dev \
  && docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp \
  && docker-php-ext-install -j$(nproc) gd \
  && docker-php-ext-install pdo pdo_mysql \
  && docker-php-ext-install bcmath

RUN rm -rf /tmp/* \
  && rm -rf /var/lib/apt/lists/* \
  && apt-get clean 
