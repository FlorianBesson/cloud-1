#! /bin/sh

wp config create \
    --dbname=${DB_NAME} \
    --dbuser=${DB_USER} \
    --dbpass=${DB_PASSWORD} \
    --dbhost=mariadb \
    --allow-root

exec "$@"
