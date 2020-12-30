qt2_wrap_cpp(kstart_MOC SOURCES kstart.h)
add_executable(kstart kstart.C ${kstart_MOC})
target_link_libraries(kstart kde2::kdecore)
install(TARGETS kstart RUNTIME DESTINATION ${KDE2_BINDIR})

