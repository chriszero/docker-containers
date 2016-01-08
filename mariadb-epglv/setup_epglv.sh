#!/bin/sh

apt-get update -qq
apt-get install -qy locales

echo "de_DE.UTF-8 UTF-8" >> /etc/locale.gen; locale-gen
export LANG="de_DE.UTF-8"  
export LANGUAGE="de_DE:de"  
export LC_ALL="de_DE.UTF-8" 

apt-get install -qy build-essential \
	mysql-common libmariadbclient-dev libmariadbclient18 zlib1g zlib1g-dev

cd /tmp/epglv && \
	make all && \
	make install

apt-get remove -qy \
	build-essential \
	libmariadbclient-dev zlib1g-dev


apt-get autoremove -qy && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

