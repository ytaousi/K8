FROM alpine:3.12

EXPOSE 20 21
EXPOSE 20020 20021

RUN apk add vsftpd openssl openrc vim

COPY setup.sh /setup.sh
RUN chmod 777 /setup.sh

#create user
RUN adduser -D admin
RUN echo "admin:admin" | chpasswd

#setup vsftpd
RUN mkdir -p  /run/openrc/
RUN touch /run/openrc/softlevel
RUN rc-update add vsftpd
RUN cp /etc/vsftpd/vsftpd.conf /etc/vsftpd/vsftpd.conf.default
COPY vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY vsftpd.chroot_list /etc/vsftpd.chroot_list

#set ssl encryption
COPY ssl/cert.pem /etc/ssl/certs/cert.pem
COPY ssl/cert.key /etc/ssl/private/cert.key

#put files for testing
COPY ssl/cert.key /home/admin
COPY ssl/cert.pem /home/admin

ENTRYPOINT ["/bin/sh" ,"/setup.sh"]
