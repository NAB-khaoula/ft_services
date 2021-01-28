rc-service mariadb restart
rc-update add mariadb default
rc-status default
mysql -u root < "/query.sql"
/bin/sh