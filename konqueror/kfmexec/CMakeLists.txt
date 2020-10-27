set(kfmexec_SRCS
    main.cpp
    )
qt2_wrap_cpp(kfmexec_SRCS
    SOURCES
    main.h
    )
add_executable(kfmexec ${kfmexec_SRCS})
target_link_libraries(kfmexec
    kde2::kdeui
    kde2::kio
    )
install(TARGETS kfmexec RUNTIME DESTINATION ${KDE2_BINDIR})
