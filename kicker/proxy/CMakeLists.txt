set(appletproxy_SRCS
    appletproxy.cpp
    )
qt2_wrap_cpp(appletproxy_SRCS
    SOURCES
        appletproxy.h
    )

add_executable(appletproxy ${appletproxy_SRCS})
target_include_directories(appletproxy PRIVATE ../share)
target_link_libraries(appletproxy kde2::kicker)
