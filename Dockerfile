FROM phusion/baseimage:0.9.15

ENV NAGIOSADMIN_USER nagiosadmin
ENV NAGIOSADMIN_PASS nagios
ENV NAGIOS_USER_CONF_DIR /opt/nagios/userconf

# Install reqd deps
RUN apt-get update
RUN apt-get install -y nagios3 nagios-plugins nagios-nrpe-plugin

# Configure apache to start on boot
ADD apache.service /etc/service/apache/run
RUN chmod u+x /etc/service/apache/run

# Configure nagios to start on boot
ADD nagios.service /etc/service/nagios/run
RUN chmod u+x /etc/service/nagios/run

# Set the username/password
RUN mkdir -p /etc/my_init.d
ADD htpasswd.sh /etc/my_init.d/htpasswd.sh
RUN chmod u+x /etc/my_init.d/htpasswd.sh

# Enable user config to be mounted into /opt/nagios/userconf
RUN echo "cfg_dir=${/opt/nagios/userconf}" >> /etc/nagios3/nagios.cfg

EXPOSE 80
CMD ["/sbin/my_init"]
