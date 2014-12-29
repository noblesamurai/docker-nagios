FROM phusion/baseimage:0.9.15

ENV NAGIOSADMIN_USER nagiosadmin
ENV NAGIOSADMIN_PASS nagios

RUN apt-get update
RUN apt-get install -y nagios3 nagios-plugins nagios-nrpe-plugin

# Configure apache to start on boot
ADD apache.service /etc/service/apache/run
RUN chmod u+x /etc/service/apache/run

# Configure nagios to start on boot
ADD nagios.service /etc/service/nagios/run
RUN chmod u+x /etc/service/nagios/run

RUN mkdir -p /etc/my_init.d
ADD htpasswd.sh /etc/my_init.d/htpasswd.sh
RUN chmod u+x /etc/my_init.d/htpasswd.sh

EXPOSE 80
CMD ["/sbin/my_init"]
