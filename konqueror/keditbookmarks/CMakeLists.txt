set(keditbookmarks_SRCS
    main.cpp toplevel.cpp commands.cpp
    )
qt2_wrap_cpp(keditbookmarks_SRCS
    SOURCES
        toplevel.h
        commands.h
    )

add_executable(keditbookmarks
    ${keditbookmarks_SRCS}
    )
target_link_libraries(keditbookmarks
    kde2::konq
    )
install(TARGETS keditbookmarks RUNTIME DESTINATION ${KDE2_BINDIR})
