#!/bin/sh

apt-get update -qq
apt-get install -qy build-essential locales \
	mysql-common libmysqlclient-dev libmysqlclient18 zlib1g zlib1g-dev

echo "de_DE.UTF-8 UTF-8" >> /etc/locale.gen; locale-gen
export LANG="de_DE.UTF-8"  
export LANGUAGE="de_DE:de"  
export LC_ALL="de_DE.UTF-8" 


cd /tmp/epglv && \
	make all && \
	make install

apt-get remove -qy \
	build-essential \
	libmysqlclient-dev zlib1g-dev


apt-get autoremove -qy && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

