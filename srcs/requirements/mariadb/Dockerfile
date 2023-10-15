FROM		debian:buster

RUN			apt update -y && apt upgrade -y && apt-get install mariadb-server -y

COPY 		conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
RUN         chmod 0644 /etc/mysql/mariadb.conf.d/50-server.cnf

COPY 		conf/scriptmaria.sh scriptmaria.sh
RUN 		chmod +x scriptmaria.sh
ENTRYPOINT	["./scriptmaria.sh"]