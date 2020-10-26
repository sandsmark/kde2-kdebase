# This file is part of kdebase.

# kdebase is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# kdebase is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with kdebase.  If not, see <https://www.gnu.org/licenses/>.

# (C) 2018 by Helio Chissini de Castro <helio@kde.org>

cmake_minimum_required(VERSION 3.1.0)

project(kdebase VERSION 0.3.0 LANGUAGES C CXX)
list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)
#list(APPEND CMAKE_MODULE_PATH /usr/share/cmake-3.18/Modules/)

set(OpenGL_GL_PREFERENCE "LEGACY")
find_package(PAM)

if (PAM_FOUND)
    add_definitions(-DHAVE_PAM)
    add_definitions(-DUSE_PAM)

    # Some things default to xdm, which doesn't exist anymore
    # TODO: use the config.h crap
    add_definitions(-DKSCREENSAVER_PAM_SERVICE=\"system-auth\")
endif()

find_package(Qt2 REQUIRED)
find_package(DCOP REQUIRED)
find_package(kdelibs2 REQUIRED)
find_package(kdecore REQUIRED)
find_package(kdeui REQUIRED)
find_package(kdesu REQUIRED)
find_package(kssl REQUIRED)
find_package(kio REQUIRED)
find_package(ksycoca REQUIRED)
find_package(kfile REQUIRED)
find_package(kparts REQUIRED)
find_package(mcop REQUIRED)
find_package(qtmcop REQUIRED)
find_package(artsflow REQUIRED)
find_package(kmedia2 REQUIRED)
find_package(artskde REQUIRED)
find_package(kdeprint REQUIRED)
find_package(kjava REQUIRED)
find_package(khtml REQUIRED)
find_package(ZLIB REQUIRED)
find_package(Threads REQUIRED)

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/common/)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

add_subdirectory(libkonq)
add_subdirectory(kdesktop)
add_subdirectory(konqueror)
add_subdirectory(kicker)
