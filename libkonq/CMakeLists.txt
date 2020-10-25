# This file is part of libkonq.

# libkonq is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# libkonq is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with libkonq.  If not, see <https://www.gnu.org/licenses/>.

# (C) 2018 by Helio Chissini de Castro <helio@kde.org>

set(LIBKONQ_SRCS
    konq_popupmenu.cc
    knewmenu.cc
    kbookmarkmenu.cc
    kbookmark.cc
    kbookmarkbar.cc
    kbookmarkimporter.cc
    kbookmarkexporter.cc
    kbookmarkmanager.cc
    kbookmarkdrag.cc
    konq_dirlister.cc
    kfileivi.cc
    konq_iconviewwidget.cc
    konq_imagepreviewjob.cc
    konq_settings.cc
    konq_drag.cc
    konq_operations.cc
    konq_dirpart.cc
    konq_propsview.cc
    konq_events.cc
    konq_bgnddlg.cc
    konq_undo.cc
    konq_historymgr.cc
    konq_historycomm.cc
    konq_pixmapprovider.cc
    konq_faviconmgr.cc
)

qt2_wrap_cpp(moc_SRCS
    SOURCES
    kbookmarkbar.h
    kbookmarkimporter.h
    kbookmarkmanager.h
    kbookmarkmenu.h
    kbookmarkmenu.h
    knewmenu.h
    konq_bgnddlg.h
    konq_bgnddlg.h
    konq_dirlister.h
    konq_dirpart.h
    konq_drag.h
    konq_faviconmgr.h
    konq_historymgr.h
    konq_iconviewwidget.h
    konq_imagepreviewjob.h
    konq_operations.h
    konq_popupmenu.h
    #konq_sound.h
    konq_undo.h
    konq_undo.h
    )

add_library(konq
    ${moc_SRCS}
    ${LIBKONQ_SRCS}
    ${UI_RESOURCES}
    )

target_compile_definitions(konq PUBLIC
    PACKAGE="libkonq"
    VERSION="${PROJECT_VERSION}"
    )

target_link_libraries(konq
    kde2::kdecore
    kde2::kdeui
    kde2::kio
    kde2::kfile
    ZLIB::ZLIB
    Threads::Threads
    )
