FROM ubuntu:15.10
MAINTAINER geekgit
RUN dpkg --add-architecture i386 \
&& apt-get update \
&& apt-get upgrade -y \
&& apt-get install -y software-properties-common
RUN ln -sf /bin/bash /bin/sh
# Apache 2
RUN apt-get install -y apache2
# PHP
RUN apt-get install -y php5 libapache2-mod-php5 php5-gd
# MySQL
ENV MySQLPassword password
RUN debconf-set-selections <<< "mysql-server mysql-server/root_password password $MySQLPassword"
RUN debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $MySQLPassword"
RUN apt-get install -y mysql-server php5-mysql
# Postgres
RUN apt-get install -y postgresql php5-pgsql
# ASP.NET, Mono
RUN apt-get install -y libapache2-mod-mono
# Tools
RUN apt-get install -y links lynx nano htop
# User
RUN adduser --disabled-password --gecos '' user
USER user
WORKDIR /home/user
RUN mkdir html
USER root
RUN mv /var/www/html /var/www/html.backup
RUN ln -sf /home/user/html /var/www/
RUN addgroup web-group
RUN adduser www-data web-group
RUN adduser user web-group
RUN usermod -g web-group user
# Config
ADD config/000-default.conf /etc/apache2/sites-available/000-default.conf
# Html
ADD html/index.html /home/user/html/index.html
# Bin
ADD bin/apache2-start.sh /bin/apache2-start
RUN chmod a+rx-w /bin/apache2-start
ADD bin/apache2-stop.sh /bin/apache2-stop
RUN chmod a+rx-w /bin/apache2-stop
ADD bin/apache2-restart.sh /bin/apache2-restart
RUN chmod a+rx-w /bin/apache2-restart
ENTRYPOINT ["/bin/bash"]
