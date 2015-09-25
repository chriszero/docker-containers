#!/bin/bash

ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime
echo 'de_DE.UTF-8 UTF-8' >> /etc/locale.gen
locale-gen
echo 'LANG=de_DE.UTF-8' > /etc/locale.conf
source /etc/profile
useradd -u 1000 -r -s /usr/bin/nologin vdr && usermod -aG log,disk,bin vdr
	
pacman -U --noconfirm vdr4arch-keyring-20130219-1-any.pkg.tar.xz
pacman-key --init
pacman-key --populate vdr4arch

printf '%s\n%s' '[vdr4arch]' 'Server = http://creimer.net/vdr4arch/repos/$repo/os/$arch' >> /etc/pacman.conf
pacman -Sy 
pacman -S --noconfirm nano vdr vdr-satip vdr-live vdr-dvbapi vdr-epg2vdr vdr-vnsiserver vdr-restfulapi vdr-streamdev-server vdr-epgsearch vdr-remotetimers vdr-dummydevice vdr-wirbelscan 
pacman -Scc --noconfirm


ln -s /etc/vdr/conf.avail/50-dvbapi.conf /etc/vdr/conf.d/
ln -s /etc/vdr/conf.avail/50-live.conf /etc/vdr/conf.d/
ln -s /etc/vdr/conf.avail/50-satip.conf /etc/vdr/conf.d/
ln -s /etc/vdr/conf.avail/50-wirbelscan.conf /etc/vdr/conf.d/
ln -s /etc/vdr/conf.avail/50-dummydevice.conf /etc/vdr/conf.d/
mkdir -p /srv/vdr/video && chown -R vdr:vdr /srv/vdr/video

mv channels.conf /var/lib/vdr/channels.conf
chown vdr /var/lib/vdr/channels.conf

#sed -i 's/#--user=user/--user=root/' /etc/vdr/conf.d/00-vdr.conf
