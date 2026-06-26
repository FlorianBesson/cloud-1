#! /bin/sh

mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld
chown -R mysql:mysql /var/lib/mysql

if [ ! -f "${ROOT_MARIADB}.setup_done" ]; then
    mariadb-install-db --user=mysql --datadir=/var/lib/mysql
    mariadbd --user=mysql --skip-networking & PID="$!"

    sleep 3

    mysql -e "CREATE DATABASE \`${DB_NAME}\`;"
    mysql -e "CREATE USER \`${DB_USER}\`@'%' IDENTIFIED BY '${DB_PASSWORD}';"
    mysql -e "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO \`${DB_USER}\`@'%';"
    mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';"
    mysql -p"${DB_ROOT_PASSWORD}" -e "FLUSH PRIVILEGES;"

    mysqladmin -u root -p${DB_ROOT_PASSWORD} shutdown
    wait "$PID"
fi
