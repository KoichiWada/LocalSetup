FROM wada/ussh
MAINTAINER Koichi WADA <kw.nachos@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get upgrade -y

# installation
RUN apt-get --no-install-recommends install -y \
    mysql-server mysql-client \
    apache2 \
    php5 php5-curl libapache2-mod-php5 php5-mysql phpunit \
    && apt-get clean && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/* 

ENV DEBIAN_FRONTEND dialog

# expose
EXPOSE 80

# init
ADD init.sh /init.sh
CMD ["/init.sh"]