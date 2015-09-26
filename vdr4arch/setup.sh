#!/bin/bash

ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime
echo 'de_DE.UTF-8 UTF-8' >> /etc/locale.gen
locale-gen
echo 'LANG=de_DE.UTF-8' > /etc/locale.conf
source /etc/profile
#useradd -u 1000 -r -s /usr/bin/nologin vdr && usermod -aG log,disk,bin vdr
	
pacman -U --noconfirm vdr4arch-keyring-20130219-1-any.pkg.tar.xz
pacman-key --init
pacman-key --populate vdr4arch

printf '%s\n%s' '[vdr4arch]' 'Server = http://creimer.net/vdr4arch/repos/$repo/os/$arch' >> /etc/pacman.conf
pacman -Sy --noconfirm nano vdr vdr-satip vdr-live vdr-dvbapi vdr-epg2vdr vdr-vnsiserver vdr-restfulapi vdr-streamdev-server vdr-epgsearch vdr-remotetimers vdr-dummydevice vdr-wirbelscan 
pacman -Scc --noconfirm

mkdir -p /srv/vdr/video

mv channels.conf /var/lib/vdr/channels.conf
chown vdr /var/lib/vdr/channels.conf

#sed -i 's/#--user=user/--user=root/' /etc/vdr/conf.d/00-vdr.conf
