#!/bin/sh
# Don't regenerate the SessionTypes list if the admin doesn't want them
# generated

if grep -qs ^generate-sessiontypes /etc/kde2/kdm/kdm.options; then
  WMS=$(cat /var/lib/dpkg/alternatives/x-window-manager | grep bin | grep -v x-window-manager | sed -e 's#/usr/bin/##' | sed -e 's#/usr/X11R6/bin/##' | sed -e 's#X11/##' | tr '\n' ',')
  WMS1=$(cat /var/lib/dpkg/alternatives/x-session-manager | grep bin | grep -v x-session-manager | sed -e 's#/usr/bin/##' | sed -e 's#/usr/X11R6/bin/##' | sed -e 's#X11/##' | tr '\n' ',')
  
  if grep -qs ^SessionTypes /etc/kde2/kdm/kdmrc; then
    cp /etc/kde2/kdm/kdmrc /etc/kde2/kdm/kdmrc.backup
    sed -e "s#SessionTypes=.*\$#SessionTypes=default,${WMS}${WMS1}failsafe#" < /etc/kde2/kdm/kdmrc >/etc/kde2/kdm/kdmrc.new
    if grep -qs ^SessionTypes /etc/kde2/kdm/kdmrc.new; then
      mv /etc/kde2/kdm/kdmrc.new /etc/kde2/kdm/kdmrc
    fi
  fi
fi

