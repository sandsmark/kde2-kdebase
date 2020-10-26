
set(kfmclient_SRCS
    kfmclient.cc 

    KonquerorIface_stub.cpp
    KDesktopIface_stub.cpp
    )

qt2_wrap_cpp(kfmclient_SRCS
    SOURCES
        kfmclient.h
    )
add_executable(kfmclient ${kfmclient_SRCS})
target_link_libraries(kfmclient
    kde2::kdeui
    kde2::kio
    kde2::kfile
    )

target_include_directories(kfmclient PRIVATE ${CMAKE_CURRENT_BINARY_DIRECTORY}/..)

