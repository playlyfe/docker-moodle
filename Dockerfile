FROM ubuntu:14.04
MAINTAINER Peter John <peter@playlyfe.com>

# Install packages
ENV DEBIAN_FRONTEND noninteractive

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8

RUN apt-get update
RUN apt-get -y install python-software-properties software-properties-common
RUN add-apt-repository -y ppa:ondrej/php
RUN apt-get update
RUN \
apt-get -y install curl supervisor apache2 mysql-client mysql-server php5.6 graphviz aspell php5.6-pspell php5.6-curl php5.6-gd php5.6-intl php5.6-mysql php5.6-xmlrpc php5.6-xml php5.6-ldap php5.6-zip

# Add image configuration and scripts
ADD start-apache2.sh /start-apache2.sh
ADD start-mysqld.sh /start-mysqld.sh
ADD run.sh /run.sh
RUN chmod 755 /*.sh
ADD my.cnf /etc/mysql/conf.d/my.cnf
ADD supervisord-apache2.conf /etc/supervisor/conf.d/supervisord-apache2.conf
ADD supervisord-mysqld.conf /etc/supervisor/conf.d/supervisord-mysqld.conf

# Remove pre-installed database
RUN rm -rf /var/lib/mysql/*

# Add MySQL utils
ADD create_mysql_admin_user.sh /create_mysql_admin_user.sh
RUN chmod 755 /*.sh

# config to enable .htaccess
ADD apache_default /etc/apache2/sites-available/000-default.conf
ADD ports_default /etc/apache2/ports.conf
RUN a2enmod rewrite

#Enviornment variables to configure php
ENV PHP_UPLOAD_MAX_FILESIZE 10M
ENV PHP_POST_MAX_SIZE 10M

# Add volumes for MySQL
VOLUME ["/etc/mysql", "/var/lib/mysql" ]

# Configure locales
RUN locale-gen en_US en_US.UTF-8
RUN dpkg-reconfigure locales

RUN adduser --disabled-password --gecos moodle moodleuser

RUN mkdir /var/www/moodledata
RUN chmod 777 /var/www/moodledata

EXPOSE 3000 3306
CMD ["/run.sh"]
