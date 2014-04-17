FROM ubuntu
MAINTAINER Koichi WADA <kw.nachos@gmail.com>

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y python-software-properties
RUN add-apt-repository ppa:ondrej/php5
RUN apt-get update
RUN apt-get upgrade -y

RUN DEBIN_FRONT_END=nointeractive apt-get install -y \
    mysql-server mysql-client \
    php5 php5-gd php5-mysql php5-curl php5-cli php5-cgi \
    apache2 libapache2-mod-php5 \
    phpmyadmin \
    nginx

RUN service apache2 restart

EXPOSE 80
