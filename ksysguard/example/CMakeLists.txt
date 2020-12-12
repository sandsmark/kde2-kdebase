include(GNUInstallDirs)
install(FILES eventsrc DESTINATION ${KDE2_APPSDIR}/ksysguard)
install(FILES ksysguarddrc DESTINATION ${CMAKE_INSTALL_FULL_SYSCONFDIR} RENAME ksysguardd2rc)
