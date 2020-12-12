add_subdirectory(gui)
add_subdirectory(CContLib)

kde2_icon(ksysguard)

install(TARGETS ksysguard2 RUNTIME DESTINATION ${KDE2_BINDIR})
