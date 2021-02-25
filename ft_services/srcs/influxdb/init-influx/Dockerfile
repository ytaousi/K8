FROM alpine:3.12

 RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk add curl influxdb

COPY setup.sh /setup.sh
RUN chmod 777 /setup.sh

ENTRYPOINT ["/bin/sh", "/setup.sh"]