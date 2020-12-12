
add_executable(ksysguardd2
    ksysguardd.c Command.c ProcessList.c
    Memory.c stat.c netdev.c PWUIDCache.c apm.c loadavg.c cpuinfo.c
    lmsensors.c netstat.c diskstat.c logfile.c conf.c
    )
add_definitions( -DVERSION=\"2.2.2\")

target_link_libraries(ksysguardd2
    kde2::ccont
    )
