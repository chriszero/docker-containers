FROM chriszero/ubuntu-s6-base
MAINTAINER chriszero <zerov83@gmail.com>

ADD src/* /tmp/
RUN /tmp/setup_epgd.sh
ADD configs/* /config/

# install runit scripts
ADD epgd.sh /etc/services.d/epgd/run
ADD epghttpd.sh /etc/services.d/epghttpd/run

EXPOSE 8888 9999

VOLUME /config
VOLUME /var/epgd

