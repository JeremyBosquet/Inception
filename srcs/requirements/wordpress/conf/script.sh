#!/bin/sh

sed -i 's/database_name_here/$MYSQL_DB_NAME/g' /var/www/html/wp-config-sample.php
sed -i 's/username_here/$MYSQL_DB_USER/g' /var/www/html/wp-config-sample.php
sed -i 's/password_here/$MYSQL_PASSWORD/g' /var/www/html/wp-config-sample.php

mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
