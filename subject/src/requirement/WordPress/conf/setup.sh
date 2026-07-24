#! /bin/sh

cd ${ROOT_WORDPRESS}
# wait to build MariaDB container
sleep 10
if [ ! -f ${ROOT_WORDPRESS}.setup_done ]; then

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
        --skip-email \
        --allow-root

    wp post delete 1 --force --path=${ROOT_WORDPRESS} --allow-root

    wp post create \
        --post_title='Cloud-1' \
        --post_content='Hello world!' \
        --post_status=publish \
        --path=${ROOT_WORDPRESS} \
        --allow-root
    wp post create \
        --post_title='new' \
        --post_content='post' \
        --post_status=publish \
        --path=${ROOT_WORDPRESS} \
        --allow-root
fi

exec "$@"
