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
