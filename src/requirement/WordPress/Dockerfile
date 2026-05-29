FROM debian:13.5

# install dependencies of wordpress
# Ref: https://ubuntu.com/tutorials/install-and-configure-wordpress#1-overview
RUN apt-get update && \
    apt-get install -y \
        php \
        php-bcmath \
        php-curl \
        php-imagick \
        php-intl \
        php-json \
        php-mbstring \
        php-xml \
        php-zip \
        curl && \
    rm -rf /var/lib/apt/lists/*

# install wordpress from WordPress.org instead of apt because this is the preferred method from upstream WordPress. 
RUN mkdir -p /srv/www && \
    chown www-data: /srv/www && \
    curl -sL https://wordpress.org/latest.tar.gz | \
    tar -xzf - -C /srv/www && \
    chown -R www-data:www-data /srv/www

CMD ["tail", "-f", "/dev/null"]
