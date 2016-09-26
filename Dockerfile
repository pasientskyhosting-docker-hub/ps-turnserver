FROM phusion/baseimage
MAINTAINER Joakim Karlsson <jk@patientsky.com>

# Set correct environment variables.
ENV HOME /root

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

RUN apt-get update && apt-get dist-upgrade -y
RUN apt-get update -y
RUN apt-get install coturn -y

RUN mkdir /etc/service/turnserver

ADD turnserver.sh /etc/service/turnserver/run
RUN chmod +x /etc/service/turnserver/run

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*