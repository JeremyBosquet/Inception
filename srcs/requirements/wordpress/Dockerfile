FROM debian:10.12

WORKDIR /var/www/html

RUN apt-get update && apt-get install wget php-cgi php-common php-fpm php-pear php-mbstring php-zip php-net-socket php-gd php-xml-util php-gettext php-mysql php-bcmath unzip -y

RUN wget https://fr.wordpress.org/latest-fr_FR.zip && unzip latest-fr_FR.zip && mv wordpress/* . && rm -rf wordpress

CMD ["/usr/bin/php7.3"]
