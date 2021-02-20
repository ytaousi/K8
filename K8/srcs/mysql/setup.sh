/etc/init.d/mariadb setup
chown -R 777 /var/lib/mysql
rc-update add mariadb
rc-service mariadb restart

#mysql < create_users.sql -u root -proot
#mysql < wp_sql
#start deamon /usr/bin/mysqld_safe --datadir='/var/lib/mysql'
#test deamon for file cd '/usr/mysql-test' ; perl mysql-test-run.pl
exec /bin/sh
