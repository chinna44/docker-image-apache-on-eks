FROM ubuntu
MAINTAINER giridhar
RUN apt-get update
RUN apt-get install apache2 -y
COPY ./index.html /var/www/html/
COPY ./conf/vhost.conf /etc/httpd/conf.modules.d/
EXPOSE 80
ENTRYPOINT ["/usr/sbin/apachectl","start"]
