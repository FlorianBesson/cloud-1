FROM debian:13.5

RUN apt-get update && \
    apt-get install -y nginx && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/nginx/conf

COPY ./config/nginx.conf /etc/nginx/conf

CMD ["nginx","-g","daemon off;"]
