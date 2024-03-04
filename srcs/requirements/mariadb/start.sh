# #!/bin/bash

sed -i '/^bind-address/s/=.*/= 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

mariadb-install-db --datadir=/var/lib/mysql

mysqld_safe &

until mysqladmin ping; do
  sleep 1
done

mysql -e "CREATE DATABASE IF NOT EXISTS ${INCEPTION_MYSQL_DATABASE};"
mysql -e "CREATE USER IF NOT EXISTS '${INCEPTION_MYSQL_USER}'@'%' IDENTIFIED BY '${INCEPTION_MYSQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON ${INCEPTION_MYSQL_DATABASE}.* TO '${INCEPTION_MYSQL_USER}'@'%';"
mysql -e "FLUSH PRIVILEGES;"

mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${INCEPTION_MYSQL_ROOT_PASSWORD}'"
mysql -p"${INCEPTION_MYSQL_ROOT_PASSWORD}" -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY '${INCEPTION_MYSQL_ROOT_PASSWORD}';"
mysql -p"${INCEPTION_MYSQL_ROOT_PASSWORD}" -e "FLUSH PRIVILEGES;"

mysqladmin -p"${INCEPTION_MYSQL_ROOT_PASSWORD}" shutdown

exec "$@"