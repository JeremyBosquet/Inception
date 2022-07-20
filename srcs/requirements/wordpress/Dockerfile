FROM debian:buster

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

RUN wget https://wordpress.org/latest.zip && unzip latest.zip && mv wordpress/* . && rm -rf wordpress

RUN chmod +x script.sh 

RUN mkdir /run/php

ENTRYPOINT ["/bin/sh", "script.sh"]
EXPOSE 9000

CMD ["/usr/sbin/php-fpm7.3", "-F"]
