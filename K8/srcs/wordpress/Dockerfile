FROM alpine:3.12

EXPOSE 5050

RUN apk update \
    && apk add vim nginx openrc mysql-client wget \
    && apk add php7-fpm php7-mcrypt php7-soap php7-openssl php7-gmp php7-pdo_odbc php7-json php7-dom php7-pdo php7-zip php7-mysqli php7-sqlite3 php7-apcu php7-pdo_pgsql php7-bcmath php7-gd php7-odbc php7-pdo_mysql php7-pdo_sqlite php7-gettext php7-xmlreader php7-xmlrpc php7-bz2 php7-iconv php7-pdo_dblib php7-curl php7-ctype

RUN mv /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf.old
COPY default.conf /etc/nginx/conf.d
COPY setup.sh /
RUN chmod 777 /setup.sh


RUN adduser -S -D -u 82 -s /sbin/nologin -h /var/www -G www-data www-data
RUN chown -R www-data:www-data /var/www

RUN mkdir -p /usr/share/webapps/wordpress
RUN wget https://wordpress.org/latest.tar.gz
RUN tar -C /usr/share/webapps/ -xvf latest.tar.gz
RUN chown -R www-data:www-data /usr/share/webapps/wordpress
COPY wp-config.php /usr/share/webapps/wordpress
RUN openrc reboot
ENTRYPOINT /setup.sh;