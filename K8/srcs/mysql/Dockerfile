FROM alpine:3.12

EXPOSE 3306

RUN apk update \
    && apk add mysql openrc mysql-client vim

COPY start.sh /
RUN chmod 777 /start.sh

RUN openrc reboot

COPY mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

COPY create_users.sql /create_users.sql
COPY install_wp.sql /install_wp.sql

ENTRYPOINT /start.sh;