FROM debian:10.12

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

RUN mkdir /run/php

CMD ["/usr/sbin/php-fpm7.3", "-F"]

EXPOSE 9000
