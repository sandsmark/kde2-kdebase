set(sidebar_SRCS
    konqsidebar.cpp
    sidebar_widget.cpp
    )

qt2_wrap_cpp(sidebar_SRCS
    SOURCES
        konqsidebar.h
        sidebar_widget.h
    )

set(sidebarplugin_SRCS
        konqsidebarplugin.cpp
    )
qt2_wrap_cpp(sidebarplugin_SRCS
    SOURCES
        konqsidebarplugin.h
    )

kde2_library(libkonqsidebar
    SOURCES
        ${sidebar_SRCS}
    LIBS
        kde2::konq
    )

kde2_library(libkonqsidebarplugin
    SOURCES
        ${sidebarplugin_SRCS}
    LIBS
        kde2::konqsidebar
    )

install(FILES konq_sidebartng.desktop DESTINATION ${KDE2_SERVICESDIR})
install(FILES konqsidebartng.rc DESTINATION ${KDE2_CONFDIR})
install(FILES .version DESTINATION ${KDE2_DATADIR}/konqsidebartng/entries/)

add_subdirectory(sidebar_classic)
add_subdirectory(trees)
