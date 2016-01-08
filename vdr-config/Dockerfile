FROM chriszero/ubuntu-s6-base
MAINTAINER chriszero <zerov83@gmail.com>

# add configs
ADD var/lib/vdr/* /var/lib/vdr/
ADD var/lib/vdr/plugins/streamdev-server/* /var/lib/vdr/plugins/streamdev-server/
ADD etc/vdr/conf.d/* /etc/vdr/conf.d/

VOLUME /etc/vdr /var/lib/vdr

ENTRYPOINT ["/bin/echo","config volumes for your vdr image"]
