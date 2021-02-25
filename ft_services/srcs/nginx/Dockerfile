FROM alpine:3.12

EXPOSE 80 443 22

RUN apk add openrc nginx vim openssh sudo

COPY setup.sh /setup.sh
RUN chmod 777 /setup.sh

#setup openrc
RUN mkdir -p  /run/openrc/
RUN touch /run/openrc/softlevel

RUN rc-update add sshd

#create user
RUN echo '%wheel ALL=(ALL) ALL' > /etc/sudoers.d/wheel
RUN adduser -D admin
RUN adduser admin wheel
RUN echo "admin:admin" | chpasswd

COPY default.conf /etc/nginx/conf.d/default.conf

COPY ssl /etc/nginx/ssl

ENTRYPOINT ["/bin/sh" , "/setup.sh"]
