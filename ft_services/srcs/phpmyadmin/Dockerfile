FROM alpine:3.12

EXPOSE 5000

RUN apk add openrc phpmyadmin nginx vim 
RUN apk add php7-fpm php7-mcrypt php7-soap php7-openssl php7-gmp php7-pdo_odbc php7-json php7-dom php7-pdo php7-zip php7-mysqli php7-sqlite3 php7-apcu php7-pdo_pgsql php7-bcmath php7-gd php7-odbc php7-pdo_mysql php7-pdo_sqlite php7-gettext php7-xmlreader php7-xmlrpc php7-bz2 php7-iconv php7-pdo_dblib php7-curl php7-ctype
RUN apk add mysql-client



COPY setup.sh /setup.sh
RUN chmod 777 /setup.sh
COPY setup_php.sh /setup_php.sh
RUN chmod 777 /setup_php.sh

#setup openrc
RUN mkdir -p  /run/openrc/
RUN touch /run/openrc/softlevel

#setup nginx

RUN adduser -D -g www www
RUN chown -R www:www /usr/share/webapps/phpmyadmin
RUN chown -R www:www /usr/share/webapps/phpmyadmin

RUN cp /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf.old

COPY default.conf /etc/nginx/conf.d/default.conf

#setup phpmyadmin
COPY config.inc.php /etc/phpmyadmin/config.inc.php

ENTRYPOINT ["/bin/sh" , "/setup.sh"]
