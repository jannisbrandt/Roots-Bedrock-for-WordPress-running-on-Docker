# -stretch added to work around this issue with freetype: https://github.com/docker-library/php/issues/865
FROM php:7.3-fpm-stretch

RUN apt-get update \
    && echo "postfix postfix/mailname string example.com" | debconf-set-selections \
    && echo "postfix postfix/main_mailer_type string 'Internet Site'" | debconf-set-selections \
    && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libz-dev \
        less \
        postfix \
        mysql-client \
        libzip-dev \
	iputils-ping \
    && docker-php-ext-install -j$(nproc) \
        mysqli \
        pdo_mysql \
        sockets \
        zip \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && pecl install xdebug-2.7.0beta1 \
    && docker-php-ext-enable xdebug \
    && apt-get remove -y build-essential libz-dev \
    && apt-get autoremove -y \
    && apt-get clean

RUN curl https://getcomposer.org/download/$(curl -LSs https://api.github.com/repos/composer/composer/releases/latest | grep 'tag_name' | sed -e 's/.*: "//;s/".*//')/composer.phar > composer.phar \
    && chmod +x composer.phar \
    && mv composer.phar /usr/local/bin/composer \
    && curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar > wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

RUN usermod -u 1000 www-data
RUN chown www-data /var/www/

EXPOSE 9000

CMD ["php-fpm"]

