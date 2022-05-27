FROM debian:10.12
RUN apt-get update && apt-get upgrade -y && apt-get install nginx -y && apt-get install openssl -y

COPY ./conf/nginx.conf /etc/nginx/nginx.conf
#RUN rm -rf /etc/nginx/sites-available/default

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssl/jbosquet.42.fr.crt -keyout /etc/ssl/jbosquet.42.fr.key -subj "/C=FR/ST=France/L=Lyon/O=42Lyon/OU=jbosquet/CN=jbosquet.42.fr"
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssl/vps.bosquetjeremy.fr.crt -keyout /etc/ssl/vps.bosquetjeremy.fr.key -subj "/C=FR/ST=France/L=Lyon/O=42Lyon/OU=jbosquet/CN=vps.bosquetjeremy.fr"

#RUN sed -i 's/TLSv1 TLSv1.1 TLSv1.2/TLSv1.3/g' /etc/nginx/nginx.conf
#RUN sed -i 's/TLSv1 TLSv1.1 TLSv1.2/TLSv1.3/g' /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]

EXPOSE 443
