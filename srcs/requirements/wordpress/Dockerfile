FROM        debian:buster

RUN         apt-get update -y && apt-get upgrade -y

RUN         apt-get -y install wget
RUN         apt-get install -y php7.3 php-fpm php-mysql mariadb-client

COPY	    ./conf/php.conf			/etc/php/7.3/fpm/pool.d/www.conf
COPY        ./tools   /usr/local/bin

RUN         mkdir /run/php
RUN         chmod +x /usr/local/bin/script.sh

ENTRYPOINT  ["script.sh"]

WORKDIR     /var/www/html

EXPOSE      9000

CMD         ["/usr/sbin/php-fpm7.3", "-F"]