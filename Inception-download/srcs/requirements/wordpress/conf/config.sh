#!/bin/sh

rm -rf /var/www/html/wordpress/wp-config.php

sleep 2

wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost="mariadb" --path="/var/www/html/wordpress/" --allow-root --skip-check
wp config set WP_CACHE true --raw --allow-root;
wp config set WP_CACHE_KEY_SALT aliburdi.42.fr --allow-root;

if ! wp core is-installed --allow-root; then
    wp core install --url="aliburdi.42.fr" --title="aliburdi's wordpress site" --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --path="/var/www/html/wordpress/" --allow-root
fi

if ! wp user get Marlena --allow-root; then
	wp user create Marlena Marlena@torna.fr --role=author --user_pass="acasa" --allow-root
fi

chown -R www-data:www-data /var/www/html/wordpress

exec php-fpm7.3 --nodaemonize
