set(ksysguard_SRCS
	ColorPicker.cc
	SensorDisplay.cc
	DummyDisplay.cc
	FancyPlotter.cc SignalPlotter.cc
	MultiMeter.cc
	DancingBars.cc BarGraph.cc
	ProcessController.cc ProcessList.cc
	ListView.cc
	LogFile.cc LogFileSettings.cc
	StyleEngine.cc
	SensorLogger.cc
	SensorBrowser.cc
	SensorManager.cc
	SensorAgent.cc SensorShellAgent.cc SensorSocketAgent.cc
	WorkSheet.cc Workspace.cc
	ksysguard.cc
        ksysguard_stub.cpp
)

qt2_wrap_ui(ksysguard_SRCS
    SOURCES
	DancingBarsSettings.ui MultiMeterSettings.ui
	FancyPlotterSettings.ui HostConnector.ui WorkSheetSettings.ui
	ListViewSettings.ui BarGraphSettings.ui StyleSettings.ui SensorLoggerDlg.ui SensorLoggerSettings.ui
    )

qt2_wrap_cpp(ksysguard_SRCS
    SOURCES
        BarGraph.h
        ColorPicker.h
        DancingBars.h
        DummyDisplay.h
        FancyPlotter.h
        KSysGuardApplet.h
        ListView.h
        LogFile.h
        LogFileSettings.h
        MultiMeter.h
        ProcessController.h
        ProcessList.h
        ReniceDlg.h
        SensorAgent.h
        SensorBrowser.h
        SensorDisplay.h
        SensorLogger.h
        SensorLogger.h
        SensorManager.h
        SensorShellAgent.h
        SensorSocketAgent.h
        SignalPlotter.h
        StyleEngine.h
        WorkSheet.h
        WorkSheetSetup.h
        Workspace.h
        ksysguard.h
    )

kde2_wrap_kidl(ksysguard_SRCS
    SOURCES
        ksysguard.h
    )

add_executable(ksysguard2 ${ksysguard_SRCS})
target_link_libraries(ksysguard2
    kde2::kdeui
    kde2::kfile
    )

install(FILES ksysguard.desktop DESTINATION ${KDE2_APPSDIR}/System)
install(FILES ksysguardui.rc DESTINATION ${KDE2_DATADIR}/ksysguard)
install(FILES x-ksysguard.desktop DESTINATION ${KDE2_MIMEDIR}/application)

install(
    FILES
        ProcessTable.sgrd SystemLoad.sgrd KSysGuardApplet.xml
    DESTINATION ${KDE2_DATADIR}/ksysguard
    )

set(ksysguardapplet_SRCS
	ColorPicker.cc
	FancyPlotter.cc SignalPlotter.cc
	SensorDisplay.cc
	StyleEngine.cc
	SensorManager.cc
	SensorAgent.cc SensorShellAgent.cc SensorSocketAgent.cc
	KSysGuardApplet.cc
    )

qt2_wrap_moc(ksysguardapplet_SRCS
        ColorPicker.h
        FancyPlotter.h
        SignalPlotter.h
        SensorDisplay.h
        StyleEngine.h
        SensorManager.h
        SensorAgent.moc
        SensorShellAgent.h
        SensorSocketAgent.h
        KSysGuardApplet.h
    )

qt2_wrap_ui(ksysguardapplet_SRCS
    SOURCES
	FancyPlotterSettings.ui HostConnector.ui KSysGuardAppletSettings.ui
	StyleSettings.ui
    )

kde2_module(ksysguardapplet
    SOURCES
        ${ksysguardapplet_SRCS}
    LIBS
        kde2::kdeui
    )

install(FILES ksysguardapplet.desktop DESTINATION "${KDE2_DATADIR}/kicker/applets/")


