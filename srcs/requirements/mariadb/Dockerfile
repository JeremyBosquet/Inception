FROM debian:buster
WORKDIR /var/lib/mysql
COPY ./conf/start.sh /tmp/start.sh
COPY ./conf/wordpress.sql /tmp/wordpress.sql

ARG DB_NAME
ARG DB_PASSWORD
ARG DB_USER
ARG DB_ROOT_PASSWORD

ENV MYSQL_DB_NAME ${DB_NAME}
ENV MYSQL_USER ${DB_USER}
ENV MYSQL_PASSWORD ${DB_PASSWORD}
ENV MYSQL_ROOT_PASSWORD ${DB_ROOT_PASSWORD}

RUN apt-get update && apt-get install mariadb-server -y

RUN chmod +x /tmp/start.sh && sh /tmp/start.sh

CMD ["mysqld_safe"]

EXPOSE 3306
