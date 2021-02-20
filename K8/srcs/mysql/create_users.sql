CREATE database phpmyadmin
CREATE database wordpress

GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' IDENTIFIED BY 'admin';
GRANT ALL PRIVILEGES ON phpmyadmin.* TO 'pma'@'%' IDENTIFIED BY  'pmapass';
GRANT ALL PRIVILEGES ON wordpress.* TO 'wp-admin'@'%' IDENTIFIED BY 'wp-admin';

FLUSH PRIVILEGES;