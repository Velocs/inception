FROM alpine:3.18

RUN apk update && apk upgrade && apk add --no-cache \
        mariadb \
        mariadb-client

COPY conf/conf.sh /tmp/conf.sh

WORKDIR /tmp/mariadb/

ENTRYPOINT ["sh", "/tmp/conf.sh"]
