# This Dockerfile builds upon the httpd Dockerfile:
# https://github.com/CentOS/CentOS-Dockerfiles/blob/master/httpd/centos7/Dockerfile
#
FROM centos:centos7
MAINTAINER TechYugadi <techyugadi@gmail.com>
#Install Apache 2.4 and PHP5
RUN yum -y update; yum clean all
RUN yum -y install httpd; yum clean all
RUN yum -y install php; yum clean all
RUN yum -y install unzip;  yum clean all
EXPOSE 80
# modified apache config to enable mod_rewrite and AllowOverride
COPY pico-httpd.conf /etc/httpd/conf/httpd.conf
# Copy pico cms files to webserver doc root. Take care of .htaccess
ADD https://github.com/picocms/Pico/archive/master.zip /pico.zip
RUN unzip /pico.zip
RUN cp -r /Pico-master/* /var/www/html/
RUN cp /Pico-master/.htaccess /var/www/html
RUN rm -rf /pico.zip /Pico-master
RUN yum -y remove unzip
# Simple startup script to avoid some issues observed with container restart
ADD run-httpd.sh /run-httpd.sh
RUN chmod -v +x /run-httpd.sh
CMD ["/run-httpd.sh"]
