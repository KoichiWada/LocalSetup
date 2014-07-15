#!/usr/bin/env bash

service rsyslog start
service ssh start
service mysql start
service apache2 start
cron

tail -f /dev/null
