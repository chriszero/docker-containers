FROM chriszero/arch-systemd
MAINTAINER chriszero <zerov83@gmail.com>

ADD http://creimer.net/vdr4arch/repo/vdr4arch-keyring-20130219-1-any.pkg.tar.xz /vdr4arch-keyring-20130219-1-any.pkg.tar.xz
COPY channels_DVBC_UM.conf channels.conf
COPY setup.sh setup.sh
RUN sh setup.sh

RUN systemctl enable vdr

# Redirect journald to /dev/console, so you can view your logs with "docker logs <container>"
RUN echo ForwardToConsole=yes >> /etc/systemd/journald.conf ;\
    echo MaxLevelConsole=debug >> /etc/systemd/journald.conf

# enable plugins
RUN ln -s /etc/vdr/conf.avail/50-dvbapi.conf /etc/vdr/conf.d/ ;\
    ln -s /etc/vdr/conf.avail/50-live.conf /etc/vdr/conf.d/ ;\
    ln -s /etc/vdr/conf.avail/50-satip.conf /etc/vdr/conf.d/ ;\
    ln -s /etc/vdr/conf.avail/50-dummydevice.conf /etc/vdr/conf.d/ ;\
    ln -s /etc/vdr/conf.avail/50-epg2vdr.conf /etc/vdr/conf.d/ ;\
    ln -s /etc/vdr/conf.avail/50-remotetimers.conf /etc/vdr/conf.d/ ;\
    ln -s /etc/vdr/conf.avail/50-epgsearch.conf /etc/vdr/conf.d/

# Ugly hack, change uid/gid to match host
RUN usermod -u 1000 vdr ;\
    groupmod -o -g 1000 vdr;\
    chown -Rc vdr:vdr /var/lib/vdr /srv/vdr /var/cache/vdr

EXPOSE 2004 6419 8002 8008

VOLUME /etc/vdr
VOLUME /var/lib/vdr
VOLUME /srv/vdr/video


CMD  ["/usr/lib/systemd/systemd"]

