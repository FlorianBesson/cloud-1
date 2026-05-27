FROM debian:13.5

RUN apt-get update && \
    apt-get install -y mariadb-server && \
    rm -rf /var/lib/apt/lists/*

CMD ["tail", "-f", "/dev/null"]