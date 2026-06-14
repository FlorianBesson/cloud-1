FROM debian:13.5

ARG ROOT_WORDPRESS

# install dependencies of wordpress
# Ref: https://ubuntu.com/tutorials/install-and-configure-wordpress#1-overview
RUN apt-get update && \
    apt-get install -y \
        php-fpm \
        php-mysql \
        php-mbstring \
        wordpress \
        curl && \
    rm -rf /var/lib/apt/lists/*

# change the port of php-fpm
RUN sed -i 's|^listen = .*|listen = 9000|' /etc/php/8.4/fpm/pool.d/www.conf

# install wordpress from WordPress.org instead of apt because this is the preferred method from upstream WordPress. 
RUN mkdir -p /srv/www/wordpress && \
    chown www-data: /srv/www/wordpress && \
    curl -sL https://wordpress.org/latest.tar.gz | \
    tar -xzf - -C /srv/www/wordpress --strip-components=1 && \
    chown -R www-data:www-data srv/www

# install wp-cli for setting up at CUI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

COPY conf/setup.sh /setup.sh

RUN chmod +x /setup.sh

ENTRYPOINT ["sh", "setup.sh"]
CMD ["php-fpm8.4", "-F"]
