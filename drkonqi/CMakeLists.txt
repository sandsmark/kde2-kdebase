add_subdirectory(debuggers)
add_subdirectory(pics)
#add_subdirectory(presets)

set(drkonqi_SRCS
        main.cpp
        debugger.cpp
        krashconf.cpp
        drbugreport.cpp
        backtrace.cpp
        toplevel.cpp
    )

qt2_wrap_cpp(drkonqi_SRCS
    SOURCES
        backtrace.h
        debugger.h
        drbugreport.h
        toplevel.h
        )

add_executable(drkonqi2 ${drkonqi_SRCS})

target_link_libraries(drkonqi2
    kde2::kdeui
    kde2::kfile
    )
install(TARGETS drkonqi2 RUNTIME DESTINATION ${KDE2_BINDIR})
