FROM phusion/baseimage
MAINTAINER chriszero <zerov83@gmail.com>

#Disable the SSH server
RUN rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh

# Set correct environment variables.
ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

RUN apt-add-repository "deb http://ppa.launchpad.net/oscam/ppa/ubuntu trusty main" && \
    gpg --keyserver keyserver.ubuntu.com --recv-keys 651987A2BDBE1D1E && gpg --export --armor 651987A2BDBE1D1E | apt-key add - && \
    apt-get update -qq && \
    apt-get install -qy oscam-svn

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

ENTRYPOINT ["/usr/bin/oscam-svn"]
CMD ["-c /config"]

EXPOSE 2000 8888 10000 10001 10002 10003 10004 10005 10006 10007 10008 10009 10010

VOLUME /config


