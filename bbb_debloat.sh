#!/bin/bash
# bbb_debloat.sh
# Beagle Bone Black dependency purging
# Based on: http://kacangbawang.com/beagleboneblack-revc-debloat-part-1/

apt-get purge xrdp

apt-get purge apache2 apache2-mpm-worker apache2-utils apache2.2-bin apache2.2-common
apt-get autoremove #get rid of no-longer needed dependencies

systemctl stop cloud9.service            #stop working copy
systemctl stop cloud9.socket             #stop working copy
systemctl disable cloud9.service         #disable autorun
systemctl disable cloud9.socket          #disable autorun
rm -rf /var/lib/cloud9                   #installed binaries and such
rm -rf /opt/cloud9                       #source download and build directory
rm /etc/default/cloud9                   #environment variables
rm /lib/systemd/system/cloud9.*          #systemd scripts
systemctl daemon-reload                  #restart/reload systemctl deamon

systemctl stop bonescript-autorun.service        #stop currently running copy
systemctl stop bonescript.service
systemctl stop bonescript.socket
systemctl disable bonescript-autorun.service     #purge autorun scripts
systemctl disable bonescript.service
systemctl disable bonescript.socket
rm /lib/systemd/system/bonescript*               #startup scripts
rm -rf /usr/local/lib/node_modules/bonescript    #binaries
systemctl daemon-reload                          #restart/reload systemctl deamon

rm -rf /opt/source/*

apt-get purge avahi-daemon

apt-get autoremove
