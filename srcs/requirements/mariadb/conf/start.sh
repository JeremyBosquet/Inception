#!/bin/sh
service mysql start
mysql -uroot -e "show databases;"
status=$?
if [ $status -eq 0 ] 
then
	mysql -uroot -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DB_NAME;"

	mysql -uroot -e "CREATE USER IF NOT EXISTS $MYSQL_USER@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';"
	mysql -uroot -e "GRANT ALL PRIVILEGES ON $MYSQL_DB_NAME.* TO $MYSQL_USER@'localhost';"
	mysql -uroot -e "FLUSH PRIVILEGES;"

	mysql -uroot -e "CREATE USER IF NOT EXISTS 'superuser'@'localhost' IDENTIFIED BY 'superPassword';"
	mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO 'superuser'@'localhost';"
	mysql -uroot -e "FLUSH PRIVILEGES;"

	mysql -uroot -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"
	mysql -uroot -p$MYSQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"
	echo "Password root changed."
fi
