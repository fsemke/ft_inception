#!bin/sh

if [ ! -d "/var/lib/mysql/$DB_DB" ]; then

	# Initialize the database
	mysql_install_db --user=mysql --ldata=/var/lib/mysql

	# replace variables
	sed -i "s/DB_DB/$DB_DB/g" /var/mariadb/db_create.sql
	sed -i "s/DB_USER/$DB_USER/g" /var/mariadb/db_create.sql
	sed -i "s/DB_PW/$DB_PW/g" /var/mariadb/db_create.sql
	sed -i "s/DB_ROOT_PW/$DB_ROOT_PW/g" /var/mariadb/db_create.sql
fi

exec "$@"
