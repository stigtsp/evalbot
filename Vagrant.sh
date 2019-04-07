#!/usr/bin/env bash

echo "deb http://deb.debian.org/debian stretch-backports main" > /etc/apt/sources.list.d/backports.list


apt-get -y update
apt-get -y install build-essential git cpanminus

apt-get -y install firejail --no-install-recommends
apt-get -y install default-jdk --no-install-recommends

apt-get -y -t stretch-backports install firejail

ln -s /home/vagrant /home/camelia
ln -s /vagrant /home/vagrant/evalbot


apt-get -y intstall libbot-basicbot-perl libconfig-file-perl libbsd-resource-perl libjson-perl
cpanm IRC/FromANSI/Tiny.pm

sudo -uvagrant -c "mkdir ~/log"

