FROM pritunl/archlinux
MAINTAINER chriszero <zerov83@gmail.com>

ADD http://creimer.net/vdr4arch/repo/vdr4arch-keyring-20130219-1-any.pkg.tar.xz /vdr4arch-keyring-20130219-1-any.pkg.tar.xz
COPY channels_DVBC_UM.conf channels.conf
COPY setup.sh setup.sh
RUN sh setup.sh

EXPOSE 2004 6419 8002 8008

VOLUME /etc/vdr
VOLUME /var/lib/vdr
VOLUME /srv/vdr/video


CMD ["vdr"]
