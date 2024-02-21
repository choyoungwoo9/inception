# #!/bin/bash

sed -i '/^bind-address/s/=.*/= 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

mariadb-install-db --datadir=/var/lib/mysql

mysqld_safe &

until mysqladmin ping; do
  sleep 1
done

mysql -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"
mysql -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';"
mysql -e "FLUSH PRIVILEGES;"

mysqladmin shutdown

exec "$@"
