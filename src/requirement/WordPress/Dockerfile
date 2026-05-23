FROM debian:13.5

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
        php-zip


CMD ["tail", "-f", "/dev/null"]