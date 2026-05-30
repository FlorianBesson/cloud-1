FROM debian:13.5

RUN apt-get update && \
    apt-get install -y mariadb-server && \
    rm -rf /var/lib/apt/lists/*

COPY conf/setup.sh /setup.sh
RUN chmod +x setup.sh
CMD ["sh", "setup.sh"]
