add_subdirectory(gui)
kde2_icon(ksysguard)

install(TARGETS ksysguard2 RUNTIME DESTINATION ${KDE2_BINDIR})
