qt2_wrap_cpp(kdesu_MOC SOURCES sudlg.h)
add_executable(kdesu kdesu.cpp sudlg.cpp ${kdesu_MOC})
target_link_libraries(kdesu kde2::kdeui kde2::kdesu)
install(TARGETS kdesu)


