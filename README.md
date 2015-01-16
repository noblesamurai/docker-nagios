docker-nagios
============

Nagios installed on top of the official Ubuntu image.

- Use env vars to have the username/password you want (cf dockerfile).
- Mount your own config files into the container.

Features:
- External commands are enabled.

For example:

```shell
sudo docker run timlesallen/nagios -v ~/git/mynagiosconfig:/opt/nagios/userconf -p 8080:80 -e NAGIOSADMIN_PASS=mypwd -d
```
