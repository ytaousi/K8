sh /setup_php.sh

mysql < /usr/share/webapps/phpmyadmin/sql/create_tables.sql -h ${DB_HOST} -u admin -padmin 
#start services
rc-update add php-fpm7
rc-status
rc-service nginx start
rc-service php-fpm7 start
rc-status

nginx -s stop
nginx -g 'daemon off;'
#exec "/bin/sh"
