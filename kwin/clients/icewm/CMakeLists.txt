qt2_wrap_cpp(icewm_MOC SOURCES icewm.h)
kde2_module(libkwinicewm
    SOURCES icewm.cpp ${icewm_MOC} LIBS kde2::kwin)
install(FILES icewm.desktop DESTINATION "${KDE2_DATADIR}/kwin")

qt2_wrap_cpp(icewm_config_MOC SOURCES config/config.h)
kde2_module(libkwinicewm_config
    SOURCES config/config.cpp ${icewm_config_MOC} LIBS kde2::kwin kde2::ksycoca)


install(FILES
        titleAB.xpm titleAJ.xpm titleAM.xpm titleAP.xpm titleAQ.xpm titleAR.xpm
        titleAS.xpm titleAT.xpm titleIB.xpm titleIJ.xpm titleIM.xpm titleIQ.xpm
        titleIR.xpm titleIS.xpm titleIT.xpm titleIP.xpm closeA.xpm closeI.xpm
        depthA.xpm depthI.xpm maximizeA.xpm maximizeI.xpm menuButtonA.xpm
        menuButtonI.xpm minimizeA.xpm minimizeI.xpm restoreA.xpm restoreI.xpm
        rolldownA.xpm rolldownI.xpm rollupA.xpm rollupI.xpm
        default.theme
    DESTINATION
        "${KDE2_DATADIR}/kwin/icewm-themes"
    )
