touch /run/openrc/softlevel
chmod -R 777 /var/lib/mysql
export mysqldata=/var/lib/mysql/mysql

/etc/init.d/mariadb setup 

rc-update add mariadb

rc-status
rc-service mariadb restart
rc-status

mysql < create_users.sql -u root -proot

mysql < install_wp.sql -u root -proot

rc-service mariadb stop
mariadbd --user=root 
