#!/bin/bash

############################
# Installs repository tools
############################

## Tools list
tools=("
	apache2
	bridge-utils
	build-essential
	cabextract
	cadaver
	cifs-utils
	chromium-browser
	curl
	default-jre
	dos2unix
	dsniff
	ent
	filezilla
	finger
	firefox
	foremost
	gparted
	ghex
	git-core
	hping3
	ipcalc
	ipmitool
	iw
	krb5-user
	libapache2-mod-php
	libssl-dev
	macchanger
	medusa
	meld
	mingw-w64
	mono-complete
	mysql-client
	netdiscover
	netsed
	network-manager-vpnc
	net-tools
	nfs-common
	nload
	open-vm-tools-desktop
	p7zip-full
	pcscd
	pcsc-tools
	perl
	php-cli
	php-curl
	putty
	pwgen
	python3-scapy
	rdesktop
	remmina
	rpl
	samdump2
	scalpel
	screen
	smbclient
	snmp
	snmp-mibs-downloader
	subversion
	tcpdump
	tcptraceroute
	testdisk
	tftp
	traceroute
	tshark
	unrar
	unzip
	vim
	vlan
	wimtools
	wine
	wine-stable
	wipe
	xtightvncviewer
")

## Install dependencies
for i in $tools
do
	installed=$(dpkg -l $i 2>&1 | grep ii)
	if [ ! "$installed" ]
	then
		echo "Installing package '$i'."
		export DEBIAN_FRONTEND=noninteractive
		apt-get -y install $i
	else
		echo "Package $i is already installed."
	fi
done

update-rc.d apache2 disable
