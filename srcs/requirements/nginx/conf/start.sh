#!/bin/sh

openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssl/$DOMAIN_NAME.crt -keyout /etc/ssl/$DOMAIN_NAME.key -subj "/C=FR/ST=France/L=Lyon/O=42Lyon/OU=jbosquet/CN=$DOMAIN_NAME"

sed -i "s/DOMAIN_NAME/$DOMAIN_NAME/g" /etc/nginx/nginx.conf  
