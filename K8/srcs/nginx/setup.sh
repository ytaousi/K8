rc-update add sshd
rc-service nginx start

#/etc/init.d/sshd start
nginx -s stop
nginx -g 'deamon off;'
exec /bin/sh
