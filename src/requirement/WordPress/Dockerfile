FROM debian:13.5

# install dependencies of wordpress
RUN apt-get update && \
    apt-get install -y \
        apache2 \
        ghostscript \
        libapache2-mod-php \
        mariadb-server \
        php \
        php-bcmath \
        php-curl \
        php-imagick \
        php-intl \
        php-json \
        php-mbstring \
        php-mysql \
        php-xml \
        php-zip \
        curl

# install wordpress from WordPress.org because this is the preferred method from upstream WordPress. 
RUN mkdir -p /srv/www && \
    chown www-data: /srv/www && \
    curl -sL https://wordpress.org/latest.tar.gz | \
    tar -xzf - -C /srv/www && \
    chown -R www-data:www-data /srv/www

CMD ["tail", "-f", "/dev/null"]
