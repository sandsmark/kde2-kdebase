qt2_wrap_cpp(libkonsole_MOC
    SOURCES
        ../include/session.h
        ../include/TEmulation.h
        ../include/TEmuVt102.h
        ../include/TEPty.h
        ../include/TEWidget.h
    )
kde2_library(libkonsole
    SOURCES
        TEPty.C
        BlockArray.C
	schema.C
	session.C
	TEWidget.C
	TEmuVt102.C
	TEScreen.C
	TEmulation.C
	TEHistory.C
	keytrans.C
        ${libkonsolepart_MOC}
    INCLUDE_DIRECTORIES
        ${CMAKE_CURRENT_SOURCE_DIR}/../include
    LIBS
        kde2::ksycoca
    )

qt2_wrap_cpp(libkonsolepart_MOC SOURCES ../include/konsole_part.h)
kde2_module(libkonsolepart
    SOURCES
        konsole_part.C
    INCLUDE_DIRECTORIES
        ${CMAKE_CURRENT_SOURCE_DIR}/../include
    LIBS
        kde2::konsole
        kde2::kparts
    )

qt2_wrap_cpp(konsole_MOC SOURCES ../include/konsole.h)
kde2_kinit_executable(konsole2
    SOURCES
        TEPty.C BlockArray.C main.C konsole.C schema.C session.C TEWidget.C TEmuVt102.C
        TEScreen.C TEmulation.C TEHistory.C keytrans.C
        ${konsole_MOC}
    INCLUDE_DIRECTORIES
        ${CMAKE_CURRENT_SOURCE_DIR}/../include
    LIBS
        kde2::ksycoca
    )

qt2_wrap_cpp(kwrited_MOC SOURCES ../include/kwrited.h)
kde2_kinit_executable(kwrited SOURCES kwrited.C ${kwrited_MOC} LIBS kde2::konsole)

add_executable(konsole_grantpty konsole_grantpty.c)
install(
    TARGETS konsole_grantpty
    PERMISSIONS
        OWNER_WRITE OWNER_READ OWNER_EXECUTE
        GROUP_READ GROUP_EXECUTE
        WORLD_READ WORLD_EXECUTE
        SETUID
    )

install(FILES konsole_part.rc DESTINATION ${KDE2_DATADIR}/konsole)
install(FILES x-konsole.desktop DESTINATION ${KDE2_MIMEDIR}/application)
install(FILES konsolerc DESTINATION ${KDE2_CONFDIR})
