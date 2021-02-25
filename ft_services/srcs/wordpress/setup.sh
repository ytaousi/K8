sh /setup_php.sh

rc-status
rc-service nginx start
rc-service php-fpm7 start
rc-status

nginx -s stop
nginx -g 'daemon off;'
#exec "/bin/sh"