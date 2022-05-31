FROM debian:buster

ARG DOMAIN
ENV DOMAIN_NAME=$DOMAIN

RUN apt-get update && apt-get upgrade -y && \
	apt-get install nginx openssl -y

COPY ./conf/start.sh /tmp/
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod +x /tmp/start.sh && sh /tmp/start.sh

CMD ["nginx", "-g", "daemon off;"]

EXPOSE 443
