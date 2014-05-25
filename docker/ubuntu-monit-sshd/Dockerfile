FROM ubuntu:latest
MAINTAINER Koichi WADA <kw.nachos@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get upgrade -y

RUN echo "Asia/Tokyo" > /etc/timezone    
RUN dpkg-reconfigure tzdata

RUN apt-get install -y git
RUN apt-get install -y monit
RUN apt-get install -y openssh-server openssh-client

RUN apt-get clean
RUN rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

ADD monitrc.d/monit /etc/monit/conf.d/monit
RUN chmod 600 /etc/monit/conf.d/monit
RUN ln -s /etc/monit/monitrc.d/rsyslog /etc/monit/conf.d/.
RUN ln -s /etc/monit/monitrc.d/cron /etc/monit/conf.d/.
RUN ln -s /etc/monit/monitrc.d/openssh-server /etc/monit/conf.d/.

RUN rm /etc/init.d/cron
ADD init.d/cron /etc/init.d/cron

ENV USER wada
RUN useradd -d /home/$USER -m -s /bin/bash $USER
RUN echo $USER:docker | chpasswd
RUN mkdir -p /home/$USER/.ssh
ADD key.pub /home/$USER/.ssh/authorized_keys
RUN chown $USER:$USER -R /home/$USER/.ssh
RUN chmod 700 /home/$USER/.ssh
RUN chmod 600 /home/$USER/.ssh/authorized_keys

EXPOSE 2812
EXPOSE 22

CMD ["/usr/bin/monit", "-I"]
