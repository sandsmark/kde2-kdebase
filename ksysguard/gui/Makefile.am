# just set the variable
appsdir = $(kde_appsdir)/System
datadir = $(kde_datadir)/ksysguard

kdemime_DATA = x-ksysguard.desktop
kdemimedir = $(kde_mimedir)/application

rcdir = $(kde_datadir)/ksysguard
rc_DATA = ksysguardui.rc

apps_DATA = ksysguard.desktop

lnkdir = $(kde_datadir)/kicker/applets
lnk_DATA = ksysguardapplet.desktop

# set the include path for X, qt and KDE
INCLUDES= $(all_includes)
 
####### This part is very ksysguard specific
# you can add here more. This one gets installed 
bin_PROGRAMS = 	ksysguard

# Which sources should be compiled for ksysguard.
ksysguard_SOURCES = \
	ColorPicker.cc \
	SensorDisplay.cc \
	DummyDisplay.cc \
	FancyPlotter.cc SignalPlotter.cc \
	MultiMeter.cc \
	DancingBars.cc BarGraph.cc \
	ProcessController.cc ProcessList.cc \
	ListView.cc \
	LogFile.cc LogFileSettings.cc \
	StyleEngine.cc \
	SensorLogger.cc \
	SensorBrowser.cc  \
	SensorManager.cc \
	SensorAgent.cc SensorShellAgent.cc SensorSocketAgent.cc \
	WorkSheet.cc Workspace.cc \
	ksysguard.cc ksysguard.skel \
	DancingBarsSettings.ui MultiMeterSettings.ui \
	FancyPlotterSettings.ui HostConnector.ui WorkSheetSettings.ui \
	ListViewSettings.ui BarGraphSettings.ui StyleSettings.ui SensorLoggerDlg.ui SensorLoggerSettings.ui

# the library search path
ksysguard_LDFLAGS = $(all_libraries) $(KDE_RPATH)

# the libraries to link against. Be aware of the order. First the libraries,
# that depend on the following ones.
ksysguard_LDADD   =       $(LIB_KDEUI) $(LIB_KFILE)

data_DATA = ProcessTable.sgrd SystemLoad.sgrd KSysGuardApplet.xml

# This stuff is now for the kicker applet
lib_LTLIBRARIES = libksysguardapplet.la

libksysguardapplet_la_SOURCES = \
	ColorPicker.cc \
	FancyPlotter.cc SignalPlotter.cc \
	SensorDisplay.cc \
	StyleEngine.cc \
	SensorManager.cc \
	SensorAgent.cc SensorShellAgent.cc SensorSocketAgent.cc \
	KSysGuardApplet.cc \
	FancyPlotterSettings.ui HostConnector.ui KSysGuardAppletSettings.ui \
	StyleSettings.ui

libksysguardapplet_la_METASOURCES = AUTO
libksysguardapplet_la_LDFLAGS = $(all_libraries) -version-info 1:0:0 -module -no-undefined
libksysguardapplet_la_LIBADD = $(LIB_KDEUI) $(LIB_KSYCOCA)

EXTRA_DIST = $(lnk_DATA)

# just to make sure, automake makes them 
METASOURCES = AUTO

messages: rc.cpp
	$(XGETTEXT) *.cpp *.cc -o $(podir)/ksysguard.pot

