add_subdirectory(gui)
add_subdirectory(CContLib)
add_subdirectory(ksysguardd)
add_subdirectory(pics)
add_subdirectory(example)

kde2_icon(ksysguard)

install(TARGETS ksysguard2 RUNTIME DESTINATION ${KDE2_BINDIR})
