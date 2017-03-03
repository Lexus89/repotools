#!/bin/bash

############################
# Installs repository tools
############################

## Tools list
tools=("
	bkhive
	bridge-utils
	cabextract
	cadaver
	cifs-utils
	dos2unix
	dsniff
	ent
	filezilla
	finger
	foremost
	gparted
	ghex
	git-core
	hping3
	icedtea-7-plugin
	ipcalc
	iw
	libssl0.9.8
	libssl-dev
	macchanger
	medusa
	mysql-client
	netdiscover
	network-manager-vpnc
	nfs-common
	nload
	openjdk-7-jre
	p7zip
	perl
	php5-cli
	php5-curl
	pwgen
	python-scapy
	rdesktop
	remmina
	rpl
	samdump2
	scalpel
	screen
	snmp
	snmp-mibs-downloader
	subversion
	tcpdump
	tcptraceroute
	testdisk
	tftp
	traceroute
	unrar
	unzip
	vim
	vlan
	wipe
	xtightvncviewer
	yersinia
")

## Install dependencies
for i in $tools
do
	installed=$(dpkg -l $i 2>&1 | grep ii)
	if [ ! "$installed" ]
	then
		echo "Installing package '$i'."
		apt-get -y install $i
	else
		echo "Package $i is already installed."
	fi
done
