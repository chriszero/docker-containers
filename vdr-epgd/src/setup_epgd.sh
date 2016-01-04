#!/bin/sh

apt-get update -qq
apt-get install -qy build-essential \
	git \
	wget unzip \
	uuid uuid-dev \
	libarchive13 libarchive-dev \
	zlib1g zlib1g-dev \
	libcurl3-nss libcurl4-nss-dev \
	libxslt1.1 libxslt1-dev \
	libxml2 libxml2-dev \
	libmariadbclient-dev libmariadbclient18 \
	libjpeg8 libjpeg-dev libtiff-dev \
	libimlib2 libimlib2-dev \
	libjansson4 libjansson-dev \
	libssl-dev \
	libmicrohttpd10 libmicrohttpd-dev \
	libimlib2 libimlib2-dev \
	libjpeg8 libjpeg-dev \
	python libpython2.7 libpython-dev python-dev \


# Compile and install
mkdir -p /usr/lib/mysql/plugin
mkdir -p /config
cd /tmp && \
	git clone -b http git://projects.vdr-developer.org/vdr-epg-daemon.git && \
	cd vdr-epg-daemon && \
	patch -p1 < ../tvm-http.diff && \
	make all install
cp /etc/epgd/* /config

# Clean up APT when done.
apt-get remove -qy \
	build-essential \
	wget \
	uuid-dev \
	libarchive-dev \
	zlib1g-dev \
	libcurl4-nss-dev \
	libxslt1-dev \
	libxml2-dev \
	libmariadbclient-dev \
	libjpeg-dev libtiff-dev \
	libimlib2-dev \
	libjansson-dev \
	libssl-dev \
	libjansson-dev \
	libmicrohttpd-dev \
	libpython-dev python-dev

apt-get autoremove -qy && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

