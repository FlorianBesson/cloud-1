FROM debian:13.5

ARG ROOT_MARIADB


exec "$@"
RUN apt-get update && \
    apt-get install -y mariadb-server && \
    rm -rf /var/lib/apt/lists/*

COPY conf/setup.sh /setup.sh

RUN chmod +x /setup.sh

# open for all address in vagrand
RUN sed -i 's/bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

ENTRYPOINT ["sh", "setup.sh"]
CMD ["mysqld_safe"]
