#!/bin/sh
# /etc/init.d/kdm: start or stop the X display manager
# Script originally stolen from the xdm package
#
# description: K Desktop Manager
#
set -e

# To start kdm even if it is not the default display manager, change
# HEED_DEFAULT_DISPLAY_MANAGER to "false."
HEED_DEFAULT_DISPLAY_MANAGER=true
DEFAULT_DISPLAY_MANAGER_FILE=/etc/X11/default-display-manager

PATH=/bin:/usr/bin:/sbin:/usr/sbin
DAEMON=/usr/bin/kdm
PIDFILE=/var/run/kdm.pid
UPGRADEFILE=/var/run/kdm.upgrade

test -x $DAEMON || exit 0

# uncomment, if you want auto-logon to be runlevel-dependant
#test "$runlevel" || { runlevel=`runlevel`; runlevel=${runlevel#* }; }
#test "$runlevel" = 4 && ARG=-autolog || ARG=-noautolog

# uncomment, if you want tons of debug info in your syslog 
#ARG="$ARG -debug 255"

# If we upgraded the daemon, we can't use the --exec argument to
# start-stop-daemon since the inode will have changed.  The risk here is that
# in a situation where the daemon died, its pidfile was not cleaned up, and
# some other process is now running under that pid, start-stop-daemon will send
# signals to an innocent process.  However, this seems like a corner case.
# C'est la vie!
if [ -e $UPGRADEFILE ]; then
  SSD_ARGS="--pidfile $PIDFILE --startas $DAEMON"
else
  SSD_ARGS="--pidfile $PIDFILE --exec $DAEMON"
fi

stillrunning () {
  if [ "$DAEMON" = "$(cat /proc/$DAEMONPID/cmdline 2> /dev/null)" ]; then
    true
  else
    # if the daemon does not remove its own pidfile, we will
    rm -f $PIDFILE $UPGRADEFILE
    false
  fi;
}

case "$1" in
  start)
    if [ -e "$DEFAULT_DISPLAY_MANAGER_FILE" ] && \
         [ "$HEED_DEFAULT_DISPLAY_MANAGER" = "true" ] && \
         [ "$(cat $DEFAULT_DISPLAY_MANAGER_FILE)" != "$DAEMON" ]; then
      echo "Not starting K Desktop Manager (kdm); it is not the default display manager."
    else
      echo -n "Starting K Desktop Manager: "
      start-stop-daemon --start --quiet $SSD_ARGS -- $ARG && echo -n "done" || echo -n "already running"
      echo "."
    fi
  ;;

  restart)
    /etc/init.d/kdm stop
    if [ -f $PIDFILE ]; then
      if stillrunning; then
        exit 1
      fi
    fi
    /etc/init.d/kdm start
  ;;

  reload|force-reload)
    echo -n "Reloading K Desktop Manager configuration: "
    if start-stop-daemon --stop --signal 1 --quiet $SSD_ARGS; then
      echo "done."
    else
      echo "kdm not running."
    fi
  ;;

  stop)
    echo -n "Stopping K Desktop Manager: "
    if [ ! -f $PIDFILE ]; then
      echo "not running ($PIDFILE not found)."
      exit 0
    else
      DAEMONPID=$(cat $PIDFILE | tr -d '[:blank:]')
      KILLCOUNT=1
      if [ ! -e $UPGRADEFILE ]; then
        start-stop-daemon --stop --quiet $SSD_ARGS || echo -n "not running"
      fi
      while [ $KILLCOUNT -le 5 ]; do
        if stillrunning; then
          kill $DAEMONPID
        else
          break
        fi
        sleep 1
        KILLCOUNT=$(expr $KILLCOUNT + 1)
      done
      if stillrunning; then
        echo -n "not responding to TERM signal (pid $DAEMONPID)"
      else
        rm -f $UPGRADEFILE
          echo -n "done"
      fi
    fi
    echo "."
  ;;

  *)
    echo "Usage: /etc/init.d/kdm {start|stop|restart|reload|force-reload}"
    exit 1
    ;;
esac

exit 0
