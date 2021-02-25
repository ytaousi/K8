##FTPS        vstfpd
##influxdb    influxd / telegraf 
##mysql       mariadbd 
##nginx       sshd / nginx
##pma         php-fpm7 / nginx
##wordpress   php-fpm7 / nginx

####pidof Service >/dev/null && echo "Service is running" || echo "Service NOT running"


# check process id if not return 0 else return 1