FROM debian:buster

RUN apt update -y -qq &&\
	apt upgrade -y -qq &&\
	apt install -y -qq php7.3 php7.3-fpm php7.3-mysql curl

WORKDIR /tmp/wordpress/

COPY conf/www.conf /etc/php/7.3/fpm/pool.d
COPY conf/config.sh /tmp/wordpress/

RUN mkdir -p /run/php ;\
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar ;\
chmod +x wp-cli.phar ;\
mv wp-cli.phar /usr/local/bin/wp


WORKDIR /var/www/html/wordpress

RUN wp core download --allow-root ;\
chown -R www-data:www-data /var/www/html

CMD ["sh", "/tmp/wordpress/config.sh"]