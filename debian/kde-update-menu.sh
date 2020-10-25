#!/bin/sh
#
# Script to properly update menu icons for KDE menu
# 
# 
#
PREFIX=$1

if [ $PREFIX = "/var/lib/kde/menu" ]; then
  rm -f `find /usr/share/applnk -type l -name "Debian"`
else
  exit 0
fi
set -e
 
OLDPREFIX=/usr/share/applnk
NEWPREFIX=/usr/share/applnk
# Old Method:  
#       Old method of menus was to have all the Debian menus under
#       a single "Debian" submenu off the KDE menu.  The newer style
#       attempts to place the individual Debian submenus under the proper
#       KDE submenus.  Set this option to 1 to use the old style menus.
# 
OLDMETHOD=0


if [ $OLDMETHOD = "1" ]; then
  ln -sf $PREFIX /usr/share/applnk/Debian
  exit 0
fi

applnk_list="Editors Multimedia System Games Office Development Graphics Internet Settings Utilities"

# clean out old links just in case
#rm -f `find $OLDPREFIX/ -type l`
rm -f `find $NEWPREFIX/ -type l`

for i in `echo $applnk_list`; do \
    /usr/bin/install -d $NEWPREFIX/$i ;\
done

if [ -e $PREFIX/Games ]; then
  cp /etc/kde2/desktop/d-debian.desktop $PREFIX/Games/.directory
  rm -f $NEWPREFIX/Games/Debian
  ln -sf $PREFIX/Games $NEWPREFIX/Games/Debian
else
  rm -f $NEWPREFIX/Games/Debian
fi
if [ -e $PREFIX/Apps ]; then
  cp /etc/kde2/desktop/d-debian.desktop $PREFIX/Apps/.directory
  rm -f $NEWPREFIX/Applications/Debian
  ln -sf $PREFIX/Apps $NEWPREFIX/Applications/Debian
else
  rm -f $NEWPREFIX/Applications/Debian
fi
if [ -e $PREFIX/Help ]; then
  cp /etc/kde2/desktop/d-help.desktop $PREFIX/Help/.directory
  rm -f $NEWPREFIX/System/Debian-Help
  ln -sf $PREFIX/Help $NEWPREFIX/System/Debian-Help
else
  rm -f $NEWPREFIX/System/Debian-Help
fi
if [ -e $PREFIX/Screen ]; then
  cp /etc/kde2/desktop/d-screen.desktop $PREFIX/Screen/.directory
  rm -f $NEWPREFIX/System/Debian-Screen
  ln -sf $PREFIX/Screen $NEWPREFIX/System/Debian-Screen
else
  rm -f $NEWPREFIX/System/Debian-Screen
fi
if [ -e $PREFIX/XShells ]; then
  cp /etc/kde2/desktop/d-xshells.desktop $PREFIX/XShells/.directory
  rm -f $NEWPREFIX/Utilities/Debian-XShells
  ln -sf $PREFIX/XShells $NEWPREFIX/Utilities/Debian-XShells
else
  rm -f $NEWPREFIX/Utilities/Debian-XShells
fi
if [ -e $PREFIX/WindowManagers ]; then
  cp /etc/kde2/desktop/d-window-managers.desktop $PREFIX/WindowManagers/.directory
  rm -f $NEWPREFIX/System/Debian-WM
  ln -sf $PREFIX/WindowManagers $NEWPREFIX/System/Debian-WM
else
  rm -f $NEWPREFIX/System/Debian-WM
fi
if [ -e $PREFIX/Apps/Databases ]; then
  mv $PREFIX/Apps/Databases $PREFIX/Databases
  cp /etc/kde2/desktop/d-databases.desktop $PREFIX/Databases/.directory
  rm -f $NEWPREFIX/Office/DEBIAN
  ln -sf $PREFIX/Databases $NEWPREFIX/Office/DEBIAN
else
  rm -f $NEWPREFIX/Office/Debian
fi
if [ -e $PREFIX/Apps/Editors ]; then
  mv $PREFIX/Apps/Editors $PREFIX/Editors
  cp /etc/kde2/desktop/d-debian.desktop $PREFIX/Editors/.directory
  rm -f $NEWPREFIX/Editors/Debian
  ln -sf $PREFIX/Editors $NEWPREFIX/Editors/Debian
else
  rm -f $NEWPREFIX/Editors/Debian
fi
if [ -e $PREFIX/Apps/Graphics ]; then
  mv $PREFIX/Apps/Graphics $PREFIX/Graphics
  cp /etc/kde2/desktop/d-debian.desktop $PREFIX/Graphics/.directory
  rm -f $NEWPREFIX/Graphics/Debian
  ln -sf $PREFIX/Graphics $NEWPREFIX/Graphics/Debian
else
  rm -f $NEWPREFIX/Graphics/Debian
fi
if [ -e $PREFIX/Apps/Math ]; then
  mv $PREFIX/Apps/Math $PREFIX/Math
  cp /etc/kde2/desktop/d-math.desktop $PREFIX/Math/.directory
  rm -f $NEWPREFIX/Utilities/Debian-Math
  ln -sf $PREFIX/Math $NEWPREFIX/Utilities/Debian-Math
else
  rm -f $NEWPREFIX/Utilities/Debian-Math
fi
if [ -e $PREFIX/Apps/Net ]; then
  mv $PREFIX/Apps/Net $PREFIX/Net
  cp /etc/kde2/desktop/d-debian.desktop $PREFIX/Net/.directory
  rm -f $NEWPREFIX/Internet/Debian
  ln -sf $PREFIX/Net $NEWPREFIX/Internet/Debian
else
  rm -f $NEWPREFIX/Internet/Debian
fi
if [ -e $PREFIX/Apps/Programming ]; then
  mv $PREFIX/Apps/Programming $PREFIX/Programming
  cp /etc/kde2/desktop/d-debian.desktop $PREFIX/Programming/.directory
  rm -f $NEWPREFIX/Development/Debian
  ln -sf $PREFIX/Programming $NEWPREFIX/Development/Debian
else
  rm -f $NEWPREFIX/Development/Debian
fi
if [ -e $PREFIX/Apps/Shells ]; then
  mv $PREFIX/Apps/Shells $PREFIX/Shells
  cp /etc/kde2/desktop/d-shells.desktop $PREFIX/Shells/.directory
  rm -f $NEWPREFIX/Utilities/Debian-Shells
  ln -sf $PREFIX/Shells $NEWPREFIX/Utilities/Debian-Shells
else
  rm -f $NEWPREFIX/Utilities/Debian-Shells
fi
if [ -e $PREFIX/Apps/Sound ]; then
  mv $PREFIX/Apps/Sound $PREFIX/Sound
  cp /etc/kde2/desktop/d-debian.desktop $PREFIX/Sound/.directory
  rm -f $NEWPREFIX/Multimedia/Debian
  ln -sf $PREFIX/Sound $NEWPREFIX/Multimedia/Debian
else
  rm -f $NEWPREFIX/Multimedia/Debian
fi
if [ -e $PREFIX/Apps/System ]; then
  mv $PREFIX/Apps/System $PREFIX/System
  cp /etc/kde2/desktop/d-debian.desktop $PREFIX/System/.directory
  rm -f $NEWPREFIX/System/Debian
  ln -sf $PREFIX/System $NEWPREFIX/System/Debian
else
  rm -f $NEWPREFIX/System/Debian
fi
if [ -e $PREFIX/Apps/Text ]; then
  cp /etc/kde2/desktop/d-text.desktop $PREFIX/Apps/Text/.directory
  rm -f $NEWPREFIX/Utilities/Debian
  ln -sf $PREFIX/Tools $NEWPREFIX/Utilities/Debian
else
  rm -f $NEWPREFIX/Utilities/Debian
fi
if [ -e $PREFIX/Apps/Tools ]; then
  mv $PREFIX/Apps/Tools $PREFIX/Tools
  cp /etc/kde2/desktop/d-debian.desktop $PREFIX/Tools/.directory
  rm -f $NEWPREFIX/Utilities/Debian
  ln -sf $PREFIX/Tools $NEWPREFIX/Utilities/Debian
else
  rm -f $NEWPREFIX/Utilities/Debian
fi
if [ -e $PREFIX/Apps/Viewers ]; then
  mv $PREFIX/Apps/Viewers $PREFIX/Viewers
  cp /etc/kde2/desktop/d-viewers.desktop $PREFIX/Viewers/.directory
  rm -f $NEWPREFIX/Utilities/Debian-Viewers
  ln -sf $PREFIX/Viewers $NEWPREFIX/Graphics/Debian-Viewers
else
  rm -f $NEWPREFIX/Utilities/Debian-Viewers
fi
if [ -e $PREFIX/Apps/Emulators ]; then
  mv $PREFIX/Apps/Emulators $PREFIX/Emulators
  cp /etc/kde2/desktop/d-emulators.desktop $PREFIX/Emulators/.directory
  rm -f $NEWPREFIX/Utilities/Debian-Emulators
  ln -sf $PREFIX/Emulators $NEWPREFIX/Utilities/Debian-Emulators
else
  rm -f $NEWPREFIX/Utilities/Debian-Emulators
fi
if [ -e $PREFIX/Apps/Hamradio ]; then
  mv $PREFIX/Apps/Hamradio $PREFIX/Hamradio
  cp /etc/kde2/desktop/d-hamradio.desktop $PREFIX/Hamradio/.directory
  rm -f $NEWPREFIX/Utilities/Debian-Hamradio
  ln -sf $PREFIX/Hamradio $NEWPREFIX/Utilities/Debian-Hamradio
else
  rm -f $NEWPREFIX/Utilities/Debian-Hamradio
fi
if [ -e $PREFIX/Apps/Technical ]; then
  mv $PREFIX/Apps/Technical $PREFIX/Technical
  cp /etc/kde2/desktop/d-technical.desktop $PREFIX/Technical/.directory
  rm -f $NEWPREFIX/Utilities/Debian-Technical
  ln -sf $PREFIX/Technical $NEWPREFIX/Utilities/Debian-Technical
else
  rm -f $NEWPREFIX/Utilities/Debian-Technical
fi

### Screen submenus ###

if [ -e $PREFIX/Screen/Lock ]; then
  cp /etc/kde2/desktop/d-lock.desktop $PREFIX/Screen/Lock/.directory
fi
if [ -e $PREFIX/Screen/Save ]; then
  cp /etc/kde2/desktop/d-save.desktop $PREFIX/Screen/Save/.directory
fi
if [ -e $PREFIX/Screen/Root-window ]; then
  cp /etc/kde2/desktop/d-root-window.desktop $PREFIX/Screen/Root-window/.directory
fi

### WindowManagers submenus ###

if [ -e $PREFIX/WindowManagers/Modules ]; then
  cp /etc/kde2/desktop/d-modules.desktop $PREFIX/WindowManagers/Modules/.directory
fi

### Games submenus ###

if [ -e $PREFIX/Games/Adventure ]; then
  cp /etc/kde2/desktop/d-adventure.desktop $PREFIX/Games/Adventure/.directory
fi
if [ -e $PREFIX/Games/Arcade ]; then
  cp /etc/kde2/desktop/d-arcade.desktop $PREFIX/Games/Arcade/.directory
fi
if [ -e $PREFIX/Games/Board ]; then
  cp /etc/kde2/desktop/d-board.desktop $PREFIX/Games/Board/.directory
fi
if [ -e $PREFIX/Games/Card ]; then
  cp /etc/kde2/desktop/d-card.desktop $PREFIX/Games/Card/.directory
fi
if [ -e $PREFIX/Games/Puzzles ]; then
  cp /etc/kde2/desktop/d-puzzles.desktop $PREFIX/Games/Puzzles/.directory
fi
if [ -e $PREFIX/Games/Sports ]; then
  cp /etc/kde2/desktop/d-sports.desktop $PREFIX/Games/Sports/.directory
fi
if [ -e $PREFIX/Games/Strategy ]; then
  cp /etc/kde2/desktop/d-strategy.desktop $PREFIX/Games/Strategy/.directory
fi
if [ -e $PREFIX/Games/Tetris-like ]; then
  cp /etc/kde2/desktop/d-tetris-like.desktop $PREFIX/Games/Tetris-like/.directory
fi
if [ -e $PREFIX/Games/Toys ]; then
  cp /etc/kde2/desktop/d-toys.desktop $PREFIX/Games/Toys/.directory
fi


exit 0
