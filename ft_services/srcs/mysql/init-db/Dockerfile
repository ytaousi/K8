FROM alpine:3.12

RUN apk add mysql-client

COPY setup.sh /setup.sh
RUN chmod 777 /setup.sh

ENTRYPOINT ["/bin/sh", "/setup.sh"]
