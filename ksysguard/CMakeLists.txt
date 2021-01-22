add_subdirectory(gui)
add_subdirectory(CContLib)
add_subdirectory(ksysguardd)
add_subdirectory(pics)
add_subdirectory(example)

kde2_stdicon(ksysguard)

install(TARGETS ksysguard2 RUNTIME DESTINATION ${KDE2_BINDIR})
