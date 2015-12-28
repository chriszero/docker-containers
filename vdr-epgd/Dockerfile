FROM phusion/baseimage
MAINTAINER chriszero <zerov83@gmail.com>

# Set correct environment variables.
ENV DEBIAN_FRONTEND noninteractive
ENV LANG de_DE.UTF-8  
ENV LANGUAGE de_DE:de  
ENV LC_ALL de_DE.UTF-8

ADD tvm-http.diff /tmp/
ADD setup_epgd.sh /tmp/
RUN /tmp/setup_epgd.sh
ADD configs/* /config/

# install runit scripts
RUN mkdir /etc/service/epgd
ADD epgd.sh /etc/service/epgd/run

RUN mkdir /etc/service/epghttpd
ADD epghttpd.sh /etc/service/epghttpd/run

CMD ["/sbin/my_init"]

EXPOSE 8888 9999

VOLUME /config
VOLUME /var/epgd

