IP=192.168.99.103

sed -i "s/pasv_address=-/pasv_address=${IP}/i" /etc/vsftpd/vsftpd.conf

# rc-status
# rc-service vsftpd restart
# rc-status

vsftpd /etc/vsftpd/vsftpd.conf
#exec /bin/sh