FROM alpine:3.12

EXPOSE 8086 8088

# update /etc/apk repo with infuxdb and telegraf
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories

RUN apk update \
    && apk add vim openrc influxdb telegraf
RUN mkdir -p /etc/telegraf
ENV TELEGRAPH_CONFIG_PATH=/etc/telegraf/telegraf.conf
# set openrc
RUN mkdir -p /run/openrc
RUN touch /run/openrc/softlevel

# coppy script
COPY setup.sh /setup.sh
RUN chmod 777 /setup.sh

COPY healthcheck.sh /healthcheck.sh
RUN chmod 777 /healthcheck.sh

# set conf files
COPY influxdb.conf /etc/influxdb.conf
COPY telegraf.conf /etc/telegraf/telegraf.conf

ENTRYPOINT ["/bin/sh", "/setup.sh"]