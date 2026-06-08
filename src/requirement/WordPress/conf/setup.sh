#! /bin/sh

cd /srv/www/wordpress
# wait to build MariaDB container
sleep 10
if [ ! -f /srv/www/wordpress/.setup_done ]; then
    # set up database of wordpress
    # Ref: https://developer.wordpress.org/cli/commands/config/create/
    wp config create \
        --dbname=${DB_NAME} \
        --dbuser=${DB_USER} \
        --dbpass=${DB_PASSWORD} \
        --dbhost=mariadb \
        --allow-root
    # create the wordpress tables in the database
    # Ref: https://developer.wordpress.org/cli/commands/core/install/
    wp core install \
        --url=${WP_URL} \
        --title=${WP_TITLE} \
        --admin_user=${WP_ADMIN_USER} \
        --admin_password=${WP_ADMIN_PASSWORD} \
        --admin_email=${WP_ADMIN_EMAIL} \
        --allow-root
fi

exec "$@"
