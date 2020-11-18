# could probably make a macro or something, if I knew cmake
qt2_wrap_cpp(default_MOC SOURCES default/kdedefault.h)
kde2_module(libkwindefault
    SOURCES default/kdedefault.cpp ${default_MOC} LIBS kde2::kwin)

qt2_wrap_cpp(kde1_MOC SOURCES kde1/kde1client.h)
kde2_module(libkwinkde1
    SOURCES kde1/kde1client.cpp ${kde1_MOC} LIBS kde2::kwin)
install(FILES kde1/kde1.desktop DESTINATION "${KDE2_DATADIR}/kwin")

qt2_wrap_cpp(redmond_MOC SOURCES redmond/redmond.h)
kde2_module(libkwinredmond
    SOURCES redmond/redmond.cpp ${redmond_MOC} LIBS kde2::kwin)
install(FILES redmond/redmond.desktop DESTINATION "${KDE2_DATADIR}/kwin")

qt2_wrap_cpp(quartz_MOC SOURCES quartz/quartz.h)
kde2_module(libkwinquartz
    SOURCES quartz/quartz.cpp ${quartz_MOC} LIBS kde2::kwin)
install(FILES quartz/quartz.desktop DESTINATION "${KDE2_DATADIR}/kwin")

qt2_wrap_cpp(icewm_MOC SOURCES icewm/icewm.h)
kde2_module(libkwinicewm
    SOURCES icewm/icewm.cpp ${icewm_MOC} LIBS kde2::kwin)
install(FILES icewm/icewm.desktop DESTINATION "${KDE2_DATADIR}/kwin")

qt2_wrap_cpp(mwm_MOC SOURCES mwm/mwmclient.h)
kde2_module(libkwinmwm
    SOURCES mwm/mwmclient.cpp ${mwm_MOC} LIBS kde2::kwin)
install(FILES mwm/mwm.desktop DESTINATION "${KDE2_DATADIR}/kwin")

qt2_wrap_cpp(b2_MOC SOURCES b2/b2client.h)
kde2_module(libkwinb2
    SOURCES b2/b2client.cpp ${b2_MOC} LIBS kde2::kwin)
install(FILES b2/b2.desktop DESTINATION "${KDE2_DATADIR}/kwin")

qt2_wrap_cpp(modernsys_MOC SOURCES modernsystem/modernsys.h)
kde2_module(libkwinmodernsys
    SOURCES modernsystem/modernsys.cpp ${modernsys_MOC} LIBS kde2::kwin)
install(FILES modernsystem/modernsystem.desktop DESTINATION "${KDE2_DATADIR}/kwin")

qt2_wrap_cpp(laptop_MOC SOURCES laptop/laptopclient.h)
kde2_module(libkwinlaptop
    SOURCES laptop/laptopclient.cpp ${laptop_MOC} LIBS kde2::kwin)
install(FILES laptop/laptop.desktop DESTINATION "${KDE2_DATADIR}/kwin")

qt2_wrap_cpp(system_MOC SOURCES system/systemclient.h)
kde2_module(libkwinsystem
    SOURCES system/systemclient.cpp ${system_MOC} LIBS kde2::kwin)
install(FILES system/system.desktop DESTINATION "${KDE2_DATADIR}/kwin")

qt2_wrap_cpp(kstep_MOC SOURCES kstep/nextclient.h)
kde2_module(libkwinkstep
    SOURCES kstep/nextclient.cpp ${kstep_MOC} LIBS kde2::kwin)
install(FILES kstep/kstep.desktop DESTINATION "${KDE2_DATADIR}/kwin")

#add_subdirectory(kwmtheme)
#add_subdirectory(riscos)
#add_subdirectory(web)
