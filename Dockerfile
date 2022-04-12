FROM centos:7
MAINTAINER giridhar
RUN yum update -y
RUN yum install httpd -y
COPY ./index.html /var/www/html/
COPY ./conf/vhost.conf /etc/httpd/conf.modules.d/
EXPOSE 80
ENTRYPOINT ["/usr/sbin/httpd","-D","FOREGROUND"]
