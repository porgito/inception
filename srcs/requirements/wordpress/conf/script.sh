#!/bin/sh -x

sleep 10

/usr/local/bin/wp core download 	--allow-root --path="/var/www/wordpress"

/usr/local/bin/wp config create		--allow-root \
									--dbname=$SQL_DATABASE \
									--dbuser=$SQL_USER \
									--dbpass=$SQL_PASSWORD \
									--dbhost=mariadb:3306 --path='/var/www/wordpress'

/usr/local/bin/wp core install 		--allow-root \
  									--url=$WP_URL \
									--title=$WP_TITLE \
									--admin_user=$WP_ADMIN_NAME \
									--admin_password=$WP_ADMIN_PASSWORD \
									--admin_email=$WP_ADMIN_MAIL \
									--skip-email --path='/var/www/wordpress'

/usr/local/bin/wp user create		--allow-root \
									$WP_NAME \
									$WP_MAIL \
									--user_pass=$WP_PASSWORD \
									--role=author --path='/var/www/wordpress'

if [ ! -d /run/php ]; then
    mkdir -p /run/php
fi


/usr/sbin/php-fpm7.3 -F