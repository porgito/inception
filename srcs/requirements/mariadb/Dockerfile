FROM		debian:buster

RUN			apt update -y && apt upgrade -y && apt-get install mariadb-server -y

COPY 		conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
RUN         chmod 0644 /etc/mysql/mariadb.conf.d/50-server.cnf

COPY 		conf/script.sh script.sh
RUN 		chmod +x script.sh
ENTRYPOINT	["./script.sh"]