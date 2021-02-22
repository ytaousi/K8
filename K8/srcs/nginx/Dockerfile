FROM alpine:3.12

EXPOSE 80 443 22

RUN apk update \
    && apk add vim openrc nginx openssh

RUN openrc reboot

RUN mv /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf.old
COPY default.conf /etc/nginx/conf.d

RUN adduser -S -D -u 82 -s /sbin/nologin -h /var/www -G www-data www-data
RUN chown -R www-data:www-data /var/www

COPY setup.sh /setup.sh
RUN chmod 777 /setup.sh

ENTRYPOINT ["/bin/sh","/setup.sh"]
