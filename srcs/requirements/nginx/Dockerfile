FROM debian:10.12

RUN apt-get update && apt-get upgrade -y && apt-get install nginx -y && apt-get install openssl -y

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssl/jbosquet.42.fr.pem -keyout /etc/ssl/jbosquet.42.fr.key -subj "/C=FR/ST=Jeremy/L=Bosquet/O=42 /OU=42/CN=jbosquet.42.fr"
RUN sed -i 's/TLSv1 TLSv1.1 TLSv1.2/TLSv1.3/g' /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]
