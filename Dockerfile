FROM ubuntu
MAINTAINER giridhar
RUN apt-get update
RUN apt-get install apache2 -y
COPY ./index.html /var/www/html/
COPY ./conf/vhost.conf /etc/apache2/conf-enabled/
EXPOSE 80
ENTRYPOINT ["/usr/sbin/apachectl","start"]
