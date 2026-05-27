FROM debian:13.5

RUN apt-get update && \
    apt-get install -y nginx openssl && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/nginx/ssl

# create self certification temporary for the test if it works
# we need to implement a function make keys by ansible someday
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/ssl.key \
    -out /etc/nginx/ssl/ssl.crt \
    -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=Student/CN=localhost"

COPY ./config/nginx.conf /etc/nginx/conf.d/nginx.conf

CMD ["nginx","-g","daemon off;"]
