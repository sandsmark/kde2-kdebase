qt2_wrap_cpp(kpager_MOC
    SOURCES
        config.h
        desktop.h
        kpager.h
    )

add_executable(kpager
    desktop.cpp kpager.cpp config.cpp windowdrag.cpp main.cpp
    ${kpager_MOC}
    )

target_link_libraries(kpager kde2::kdeui)
install(FILES kpager.desktop DESTINATION ${KDE2_APPSDIR}/Utilities)
kde2_stdicon()
install(TARGETS kpager DESTINATION ${KDE2_BINDIR})

