FROM l3iggs/archlinux
MAINTAINER chriszero <zerov83@gmail.com>

RUN echo dockervdr01 > /etc/hostname
RUN ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime

ADD http://creimer.net/vdr4arch/repo/vdr4arch-keyring-20130219-1-any.pkg.tar.xz /vdr4arch-keyring-20130219-1-any.pkg.tar.xz
RUN pacman -U --noconfirm vdr4arch-keyring-20130219-1-any.pkg.tar.xz \
	&& pacman-key --init \
	&& pacman-key --populate vdr4arch
RUN printf '%s\n%s' '[vdr4arch]' 'Server = http://creimer.net/vdr4arch/repos/$repo/os/$arch' >> /etc/pacman.conf
RUN pacman -Sy \
	&& pacman -S --noconfirm vdr vdr-satip vdr-live vdr-dvbapi vdr-epg2vdr vdr-vnsiserver vdr-xvdr vdr-restfulapi vdr-markad vdr-streamdev-server vdr-epgsearch vdr-remotetimers

RUN ln -s /etc/vdr/conf.avail/50-dvbapi.conf /etc/vdr/conf.d/
RUN ln -s /etc/vdr/conf.avail/50-live.conf /etc/vdr/conf.d/
RUN ln -s /etc/vdr/conf.avail/50-satip.conf /etc/vdr/conf.d/
RUN mkdir -p /srv/vdr/video && chown -R vdr:vdr /srv/vdr/video

EXPOSE 2004 6419 8002 8008

VOLUME /etc/vdr
VOLUME /var/lib/vdr
VOLUME /srv/vdr/video

USER vdr

CMD ["vdr"]
