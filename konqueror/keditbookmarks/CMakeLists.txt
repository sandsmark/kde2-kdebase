set(keditbookmarks_SRCS
    main.cpp toplevel.cpp commands.cpp
    )
qt2_wrap_cpp(keditbookmarks_SRCS
    SOURCES
        toplevel.h
        commands.h
    )

kde2_kinit_executable(keditbookmarks
    SOURCES
        ${keditbookmarks_SRCS}
    LIBS
        kde2::konq
    )
