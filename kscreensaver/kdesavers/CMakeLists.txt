set(kbanner_SRCS banner.cpp)
qt2_wrap_cpp(kbanner_SRCS SOURCES banner.h)
add_executable(kbanner.kss ${kbanner_SRCS})
target_link_libraries(kbanner.kss kde2::kscreensaver)

set(kblankscreen_SRCS blankscrn.cpp)
qt2_wrap_cpp(kblankscreen_SRCS SOURCES blankscrn.h)
add_executable(kblankscreen.kss ${kblankscreen_SRCS})
target_link_libraries(kblankscreen.kss kde2::kscreensaver)

set(kblob_SRCS blob.cpp)
qt2_wrap_cpp(kblob_SRCS SOURCES blob.h)
add_executable(kblob.kss ${kblob_SRCS})
target_link_libraries(kblob.kss kde2::kscreensaver)

set(klines_SRCS lines.cpp)
qt2_wrap_cpp(klines_SRCS SOURCES lines.h)
add_executable(klines.kss ${klines_SRCS})
target_link_libraries(klines.kss kde2::kscreensaver)

set(klorenz_SRCS lorenz.cpp)
qt2_wrap_cpp(klorenz_SRCS SOURCES lorenz.h)
add_executable(klorenz.kss ${klorenz_SRCS})
target_link_libraries(klorenz.kss kde2::kscreensaver)

set(kmatrix_SRCS matrix.cpp)
qt2_wrap_cpp(kmatrix_SRCS SOURCES matrix.h)
add_executable(kmatrix.kss ${kmatrix_SRCS})
target_link_libraries(kmatrix.kss kde2::kscreensaver)

set(kpolygon_SRCS polygon.cpp)
qt2_wrap_cpp(kpolygon_SRCS SOURCES polygon.h)
add_executable(kpolygon.kss ${kpolygon_SRCS})
target_link_libraries(kpolygon.kss kde2::kscreensaver)

set(kscience_SRCS science.cpp)
qt2_wrap_cpp(kscience_SRCS SOURCES science.h)
add_executable(kscience.kss ${kscience_SRCS})
target_link_libraries(kscience.kss kde2::kscreensaver)

set(kslideshow_SRCS slideshow.cpp)
qt2_wrap_cpp(kslideshow_SRCS SOURCES slideshow.h)
add_executable(kslideshow.kss ${kslideshow_SRCS})
target_link_libraries(kslideshow.kss kde2::kscreensaver kde2::kfile)

set(kvm_SRCS kvm.cpp vm.c vm_random.c)
qt2_wrap_cpp(kvm_SRCS SOURCES kvm.h)
add_executable(kvm.kss ${kvm_SRCS})
target_link_libraries(kvm.kss kde2::kscreensaver)
