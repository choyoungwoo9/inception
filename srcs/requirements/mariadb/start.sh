# #!/bin/bash

while true; do
sleep 1;
done;


sed -i '/^bind-address/s/=.*/= 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf
# sed -i 's/character-set-server\s*=\s*utf8mb4/character-set-server = utf8mb4_bin/' /etc/mysql/mariadb.conf.d/50-server.cnf

mariadb-install-db --datadir=/var/lib/mysql

mysqld_safe &

until mysqladmin ping; do
  sleep 1
done

mysql -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"
mysql -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';"
mysql -e "FLUSH PRIVILEGES;"

mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}'"
mysql -p"'${MYSQL_ROOT_PASSWORD}'" -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}'"
mysql -p"'${MYSQL_ROOT_PASSWORD}'" -e "FLUSH PRIVILEGES;"

# mysqladmin -p"'${MYSQL_ROOT_PASSWORD}'" shutdown
mysqladmin -p"'${MYSQL_ROOT_PASSWORD}'" shutdown

exec "$@"