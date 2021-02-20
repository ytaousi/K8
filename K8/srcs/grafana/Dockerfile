FROM alpine:3.12

EXPOSE 3000

RUN apk update \
    && apk add vim wget

COPY setup.sh /
RUN chmod 777 /setup.sh 
RUN wget https://dl.grafana.com/oss/release/grafana-7.4.2.linux-amd64.tar.gz
RUN mkdir -p /usr/share/webapps
RUN tar -C /usr/share/webapps -xvf  grafana-7.4.2.linux-amd64.tar.gz


ENTRYPOINT /setup.sh;