FROM    debian:buster

RUN apt update -y && apt upgrade && apt install nginx -y

RUN mkdir -p /etc/nginx/ssl
RUN apt install openssl -y
RUN openssl req -x509 -nodes \
        -out /etc/nginx/ssl/jlaurent.crt \
        -keyout /etc/nginx/ssl/jlaurent.key \
        -subj "/C=CH/ST=VD/L=LAUSANNE/O=42/OU=42/CN=jlaurent.42.ch/UID=jlaurent"

RUN mkdir -p /var/run/nginx

COPY ./conf/nginx.conf /etc/nginx/conf.d
#COPY index.html /var/www/html

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

CMD ["nginx", "-g", "daemon off;"]