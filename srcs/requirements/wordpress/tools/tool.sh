#!/bin/bash

if [ -f "/var/www/wordpress/wp-config.php" ]; then
	echo "Wordpress already exist"
	exec /usr/sbin/php-fpm81 -F
else
	wp core download --allow-root
	wp core config --dbname="$DB_DB" --dbuser="$DB_USER" --dbpass="$DB_PW" --dbhost="$DB_HOST:$DB_PORT" --dbprefix='wp_' --allow-root
	wp core install --url="$WP_ADMIN.42.fr" --title="Welcome to my own website" --admin_user="$WP_ADMIN" --admin_password="$WP_ADMIN_PW" --admin_email="$WP_ADMIN@adminmail.de" --allow-root
	wp user create $WP_USER $WP_USER@user.com --role='subscriber' --user_pass="$WP_PW" --allow-root
	#wp option update comment_registration 1 --allow-root
	exec /usr/sbin/php-fpm81 -F
fi
