# This file is part of kdesktop.

# kdesktop is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# kdesktop is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with kdesktop.  If not, see <https://www.gnu.org/licenses/>.

# (C) 2018 by Helio Chissini de Castro <helio@kde.org>


add_subdirectory(pics)
#add_subdirectory(kwebdesktop)

KDE2_KIDL(KDesktopIface.h)

set(kdesktop_SRCS
    krootwm.cc xautolock.cc kdiconview.cc desktop.cc main.cc
    lockeng.cc lockdlg.cc
    bgmanager.cc init.cc
    minicli.cpp pixmapserver.cc kcustommenu.cc
    startupid.cpp

    ../kcontrol/background/bgsettings.cc
    ../kcontrol/background/bgrender.cc
)

qt2_wrap_cpp(moc_SRCS
    SOURCES
    bgmanager.h
    desktop.h
    kcustommenu.h
    kdiconview.h
    kdmdesktop.h
    krootwm.h
    kwebdesktop/kwebdesktop.h
    kwebdesktop/kwebdesktop.h
    lockdlg.h
    lockeng.h
    minicli.h
    minicli.h
    pixmapserver.h
    startupid.h
    xautolock.h

    ../kcontrol/background/bgrender.h
    )

add_executable(kdesktop
    ${moc_SRCS}
    ${kdesktop_SRCS}
    ${UI_RESOURCES}
    )

target_compile_definitions(kdesktop PUBLIC
    PACKAGE="kdesktop"
    VERSION="${PROJECT_VERSION}"
    )

target_include_directories(kdesktop PRIVATE
    ../kcontrol/background/
    )

target_link_libraries(kdesktop
    kde2::kdecore
    kde2::kdeui
    kde2::kio
    kde2::kfile
    kde2::konq
    ZLIB::ZLIB
    Threads::Threads
    )

# Match everything else, though I don't like the global autostart dir
install(FILES kdesktop.desktop DESTINATION ${KDEDIR}/share/autostart)
install(FILES kdesktop_custom_menu1 kdesktop_custom_menu2 DESTINATION ${KDE2_CONFDIR})

install(FILES
    programs/xearth.desktop
    programs/xglobe.desktop
    programs/xplanet.desktop
    DESTINATION ${KDE2_DATADIR}/kdesktop/programs)

install(FILES
    init/directory.trash
    init/directory.autostart
    init/directory.templates
    init/directory.desktop
    DESTINATION ${KDE2_DATADIR}/kdesktop/)

install(FILES
    init/Home.desktop
    DESTINATION ${KDE2_DATADIR}/kdesktop/DesktopLinks/)

install(FILES
    init/Templates/linkProgram.desktop
    init/Templates/linkURL.desktop
    init/Templates/linkFloppy.desktop
    init/Templates/linkHD.desktop
    init/Templates/linkCDROM.desktop
    init/Templates/Directory.desktop
    init/Templates/TextFile.desktop
    init/Templates/HTMLFile.desktop
    DESTINATION ${KDE2_TEMPLATESDIR})

install(FILES
    init/Templates/Program.desktop
    init/Templates/URL.desktop
    init/Templates/Floppy.desktop
    init/Templates/HD.desktop
    init/Templates/CDROM-Device.desktop
    init/Templates/TextFile.txt
    init/Templates/HTMLFile.html
    DESTINATION ${KDE2_TEMPLATESDIR}/.source/)

install(FILES
    patterns/night-rock.desktop
    patterns/night-rock.jpg
    patterns/stonewall2.png
    patterns/stonewall2.desktop
    patterns/fish.desktop
    patterns/fish.png
    patterns/flowers.desktop
    patterns/flowers.png
    patterns/pavement.desktop
    patterns/pavement.png
    patterns/rattan.desktop
    patterns/rattan.png
    patterns/triangles.desktop
    patterns/triangles.png
    DESTINATION ${KDE2_DATADIR}/kdesktop/patterns/)