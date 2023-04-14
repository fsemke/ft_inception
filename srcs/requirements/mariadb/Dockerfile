FROM debian:bullseye

EXPOSE 3306

# Need to delete these var:
ARG DB_HOST
ARG DB_PORT
ARG DB_DB
ARG DB_USER
ARG DB_PW
ARG DB_ROOT_PW

RUN apt-get update && apt-get upgrade -y \
&&  apt-get install -y mariadb-server

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./conf/db_create.sql /

RUN sed -i "s/DB_DB/$DB_DB/g" /db_create.sql \
 && sed -i "s/DB_USER/$DB_USER/g" /db_create.sql \
 && sed -i "s/DB_PW/$DB_PW/g" /db_create.sql \
 && sed -i "s/DB_ROOT_PW/$DB_ROOT_PW/g" /db_create.sql

RUN service mariadb start && mariadb < db_create.sql
#RUN rm -f db_create.sql

CMD ["mysqld"]

