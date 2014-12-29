#!/bin/bash
htpasswd -c -b -s /etc/nagios3/htpasswd.users ${NAGIOSADMIN_USER} ${NAGIOSADMIN_PASS} && chown nagios.nagios /etc/nagios3/htpasswd.users
