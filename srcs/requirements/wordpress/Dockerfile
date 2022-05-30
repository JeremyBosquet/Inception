FROM debian:10.12

ARG DB_NAME
ARG DB_PASSWORD
ARG DB_USER
ARG DB_ROOT_PASSWORD

ENV MYSQL_DB_NAME ${DB_NAME}
ENV MYSQL_USER ${DB_USER}
ENV MYSQL_PASSWORD ${DB_PASSWORD}
ENV MYSQL_ROOT_PASSWORD ${DB_ROOT_PASSWORD}

RUN mkdir -p /var/www/html
WORKDIR /var/www/html
COPY ./conf/script.sh script.sh

RUN apt-get update && apt-get install wget \
	php-cgi \
	php-common \
	php-fpm \
	php-pear \
	php-mbstring \
	php-zip \
	php-net-socket \
	php-gd \
	php-xml-util \
	php-gettext \
	php-mysql \
	php-bcmath \
	unzip \
	-y

RUN wget https://fr.wordpress.org/latest-fr_FR.zip && unzip latest-fr_FR.zip && mv wordpress/* . && rm -rf wordpress

RUN chmod +x script.sh && sh script.sh
RUN rm -rf wp-config.php
COPY ./conf/wp-config.php .

RUN mkdir /run/php

CMD ["/usr/sbin/php-fpm7.3", "-F"]

EXPOSE 9000
