set(kcontrol_SRCS
    toplevel.cpp
    indexwidget.cpp
    searchwidget.cpp
    helpwidget.cpp
    moduleinfo.cpp
    utils.cpp
    modules.cpp
    proxywidget.cpp
    modloader.cpp
    dockcontainer.cpp
    aboutwidget.cpp
    global.cpp
    quickhelp.cpp
    moduletreeview.cpp
    moduleiconview.cpp
    kecdialog.cpp
    kcrootonly.cpp
)

qt2_wrap_cpp(kcontrol_SRCS
    SOURCES
        aboutwidget.h
        dockcontainer.h
        helpwidget.h
        indexwidget.h
        kecdialog.h
        main.h
        moduleiconview.h
        moduleinfo.h
        modulemenu.h
        modules.h
        moduletreeview.h
        proxywidget.h
        quickhelp.h
        searchwidget.h
        toplevel.h
)

kde2_library(libkcontrol
    SOURCES
        ${kcontrol_SRCS}
    LIBS
        kde2::kdeui
        kde2::kfile
    )

add_executable(kcontrol main.cpp)
target_link_libraries(kcontrol kde2::kcontrol)

add_executable(kcminit kcminit.cpp)
target_link_libraries(kcminit kde2::kcontrol)

set(kcmshell_SRCS
    kcmshell.cpp
    kcdialog.cpp
    kcdialog_stub.cpp
    )
qt2_wrap_cpp(kcmshell_SRCS SOURCES kcmshell.h kcdialog.h)
kde2_wrap_kidl(kcmshell_SRCS SOURCES kcdialog.h)

add_executable(kcmshell ${kcmshell_SRCS})
target_link_libraries(kcmshell kde2::kcontrol)

install(TARGETS kcontrol kcminit kcmshell RUNTIME DESTINATION ${KDE2_BINDIR})
