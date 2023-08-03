FROM        debian:buster

RUN         apt-get update && apt-get upgrade

RUN         apt-get -y install wget
RUN         apt-get install -y php7.3 php-fpm php-mysql mariadb-client

COPY        ./conf/www.conf /etc/php/7.3/fpm/pool.d

RUN         wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN         cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz
RUN	        chown -R root:root /var/www/wordpress

RUN         wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN         chmod +x wp-cli.phar
RUN         mv wp-cli.phar /usr/local/bin/wp
RUN         rm -f /var/www/html/wp-config.php

COPY        ./conf/script.sh script.sh
RUN         chmod +x script.sh
ENTRYPOINT  ["./script.sh"]