FROM debian:13.5

ARG ROOT_PHPMYADMIN

RUN apt-get update && \
    apt-get install -y \
        php-fpm \
        php-mysql \
        php-mbstring \
        curl \
        tar && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /run/php && \
    sed -i 's|^listen = .*|listen = 9000|' /etc/php/8.4/fpm/pool.d/www.conf

# Ref: https://gist.github.com/GreepTheSheep/25f373f78f10b818be97c628abb81246
RUN mkdir -p ${ROOT_PHPMYADMIN} && \
    curl -sL https://files.phpmyadmin.net/phpMyAdmin/5.2.1/phpMyAdmin-5.2.1-all-languages.tar.gz | \
    tar -xzf - -C ${ROOT_PHPMYADMIN} --strip-components=1 && \
    chown -R www-data:www-data ${ROOT_PHPMYADMIN}

RUN cp ${ROOT_PHPMYADMIN}/config.sample.inc.php ${ROOT_PHPMYADMIN}/config.inc.php

COPY conf/setup.sh /setup.sh

ENTRYPOINT ["sh", "setup.sh"]
CMD ["php-fpm8.4", "-F"]
