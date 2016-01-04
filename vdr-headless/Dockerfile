FROM chriszero/ubuntu-s6-base
MAINTAINER chriszero <zerov83@gmail.com>

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 272A2CE18103B360 F529E113D0A5897C \
 && echo deb http://ppa.launchpad.net/yavdr/main/ubuntu trusty main   > /etc/apt/sources.list.d/yavdr.list \
 && echo deb http://ppa.launchpad.net/yavdr/stable-vdr/ubuntu trusty main  >> /etc/apt/sources.list.d/yavdr.list \
 && echo deb http://ppa.launchpad.net/yavdr/stable-yavdr/ubuntu trusty main >> /etc/apt/sources.list.d/yavdr.list \
 && echo deb http://ppa.launchpad.net/gandalf-der-grosse/main/ubuntu trusty main  > /etc/apt/sources.list.d/gandalf.list \
 && echo deb http://ppa.launchpad.net/gandalf-der-grosse/stable-vdr/ubuntu trusty main  >> /etc/apt/sources.list.d/gandalf.list

RUN apt-get update -qq && \
	apt-get install -qy \
	vdr \
	rsyslog \
	vdr-plugin-epgsearch \
	vdr-plugin-femon \
	vdr-plugin-satip \
	vdr-plugin-live \
	vdr-plugin-restfulapi \
	vdr-plugin-dvbapi \
	vdr-plugin-vnsiserver \
	vdr-plugin-vdrmanager \
	vdr-plugin-remotetimers \
	vdr-plugin-svdrpservice \
	vdr-plugin-streamdev-server \
	libmariadbclient18 uuid \
	nano && \
	apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


ADD vdr-plugin-epg2vdr_0.1.12.git20151112.0816-0yavdr2~trustyubuntu1_amd64.deb /tmp
RUN dpkg -i /tmp/vdr-plugin-epg2vdr*

ADD vdr-plugin-satip_2.2.3.git20150523.2148-2yavdr2~trustyubuntu1_amd64.deb /tmp
RUN dpkg -i /tmp/vdr-plugin-satip*

ADD vdr.sh /etc/services.d/vdr/run
ADD vdr-finish.sh /etc/services.d/vdr/finish
ADD rsyslog.sh /etc/services.d/rsyslog/run

# add configs
ADD var/lib/vdr/* /var/lib/vdr/
ADD etc/vdr/conf.d/* /etc/vdr/conf.d/
ADD etc/rsyslog.conf /etc/

# Configure the vdr user account and it's folders
RUN groupmod -o -g 9981 vdr \
 && usermod -o -u 9981 vdr \
 && install -o vdr -g vdr -d /recordings /var/cache/vdr /var/lib/vdr

EXPOSE 111 2004 2049 6419 8002 8008 4000-4100/udp
VOLUME /recordings /etc/vdr /var/lib/vdr

ENTRYPOINT ["/init"]

