#! /bin/sh

# Ref: https://docs.phpmyadmin.net/en/latest/config.html
if [ ! -f /var/www/phpmyadmin/.setup_done ]; then
    CONFIG_FILE="/var/www/phpmyadmin/config.inc.php"
    sed -i "s/localhost/mariadb/g" $CONFIG_FILE

    SECRET=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)
    sed -i "s/\$cfg\['blowfish_secret'\] = '';/\$cfg\['blowfish_secret'\] = '${SECRET}';/g" $CONFIG_FILE

    chown -R www-data:www-data /var/www/phpmyadmin
fi

exec "$@"
