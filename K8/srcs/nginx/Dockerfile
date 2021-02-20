FROM alpine:3.12

EXPOSE 80 443 22

RUN apk update \
    && apk add vim openrc nginx openssl curl

RUN openrc reboot
COPY index.html /var/www/localhost/htdocs/
RUN mv /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf.old
COPY default.conf /etc/nginx/conf.d
RUN adduser -S -D -u 82 -s /sbin/nologin -h /var/www -G www-data www-data
RUN chown -R www-data:www-data /var/www
COPY setup.sh /setup.sh
RUN chmod 777 /setup.sh
RUN openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Company, Inc./CN=mydomain.com" \
    -addext "subjectAltName=DNS:mydomain.com" \
    -newkey rsa:2048 \
    -keyout /etc/ssl/private/nginx-selfsigned.key \
    -out /etc/ssl/certs/nginx-selfsigned.crt;

ENTRYPOINT /setup.sh;
