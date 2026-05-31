#! /bin/sh

cd /srv/www/wordpress

# set up database of wordpress
wp config create \
    --dbname=${DB_NAME} \
    --dbuser=${DB_USER} \
    --dbpass=${DB_PASSWORD} \
    --dbhost=mariadb \
    --allow-root

exec "$@"
