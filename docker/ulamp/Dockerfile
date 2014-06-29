FROM ubuntu:latest
MAINTAINER Koichi WADA <kw.nachos@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get upgrade -y

# timezone
RUN echo "Asia/Tokyo" > /etc/timezone && dpkg-reconfigure tzdata

# installation
RUN apt-get --no-install-recommends install -y \
    git openssh-server openssh-client \
    mysql-server mysql-client \
    apache2 \
    php5 php5-curl libapache2-mod-php5 php5-mysql phpmyadmin phpunit \
    && apt-get clean && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/* 

ENV DEBIAN_FRONTEND dialog

# ssh login setting
ENV NEWUSER wada
RUN useradd -d /home/$NEWUSER -m -s /bin/bash $NEWUSER
RUN echo $NEWUSER:docker | chpasswd
RUN mkdir -p /home/$NEWUSER/.ssh
ADD key.pub /home/$NEWUSER/.ssh/authorized_keys
RUN chown $NEWUSER:$NEWUSER -R /home/$NEWUSER/.ssh \
    && chmod 700 /home/$NEWUSER/.ssh \
    && chmod 600 /home/$NEWUSER/.ssh/authorized_keys

# sudoers
RUN chmod 4755 /usr/bin/sudo
RUN echo "$NEWUSER ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$NEWUSER

# expose
EXPOSE 22
EXPOSE 80

# init
ADD init.sh /init.sh
CMD ["/init.sh"]
