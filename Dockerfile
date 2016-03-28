#
# Apache2 Dockerfile
#

# Pull base image.
FROM ubuntu:14.04
MAINTAINER David <jinwei.lin@gmail.com>

# Install Apache.
RUN apt-get update && \
		apt-get install -y apache2 && \
		apt-get clean && \
		rm -rf /var/lib/apt/lists/* && \
		echo "!/bin/sh ntpdate ntp.ubuntu.com" >> /etc/cron.daily/ntpdate && \
    chmod 750 /etc/cron.daily/ntpdate

COPY index.html /var/www/html
RUN /usr/sbin/a2ensite default-ssl
RUN /usr/sbin/a2enmod ssl

# Expose ports.
EXPOSE 80
EXPOSE 443

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
