FROM debian:buster

# Install Nginx
RUN apt update -y && apt upgrade -y && apt install nginx -y
RUN mkdir -p /etc/nginx/ssl
RUN apt install openssl -y
RUN openssl req -x509 -nodes \
        -out /etc/nginx/ssl/inception.crt \
        -keyout /etc/nginx/ssl/inception.key \
        -subj "/C=CH/ST=VD/L=LAUSANNE/O=42/OU=42/CN=jlaurent.42.fr/UID=jlaurent"
RUN mkdir -p /var/run/nginx
# Copy the Nginx config
COPY ./conf/default /etc/nginx/sites-available/default
#COPY index.html /usr/share/nginx/html
#COPY index.html /var/www/html/index.html
# Expose the port for access
EXPOSE 443

#RUN chmod 755 /var/www/html
#RUN chown -R www-data:www-data /var/www/html

CMD ["nginx", "-g", "daemon off;"]
