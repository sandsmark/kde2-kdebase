# this 10 paths are KDE specific. Use them:
# kde_htmldir       Where your docs should go to. (contains lang subdirs)
# kde_appsdir       Where your application file (.kdelnk) should go to.
# kde_icondir       Where your icon should go to.
# kde_sounddir      Where system sounds should go to.
# kde_datadir       Where you install application data. (Use a subdir)
# kde_locale        Where translation files should go to.(contains lang subdirs)
# kde_cgidir        Where cgi-bin executables should go to.
# kde_confdir       Where config files should go to.
# kde_mimedir       Where mimetypes should go to.
# kde_toolbardir    Where general toolbar icons should go to.
# kde_wallpaperdir  Where general wallpapers should go to.

# set the include path for X, qt and KDE
INCLUDES= $(all_includes)

# claim, which subdirectories you want to install
# if you don't have subdirectories, comment it
SUBDIRS = . pics

# you can add here more. This one gets installed
bin_PROGRAMS = 	ksplash

# Which sources should be compiled
ksplash_SOURCES = ksplash.cpp ksplash.skel

ksplash_METASOURCES = ksplash.moc

# the library search path.
ksplash_LDFLAGS = $(all_libraries) $(KDE_RPATH)

# the libraries to link against. Be aware of the order. First the libraries,
# that depend on the following ones.
ksplash_LDADD   = $(LIB_KDEUI)

# this option you can leave out. Just, if you use "make dist", you need it
noinst_HEADERS = ksplash.h

# the -x is for skipping messages already translated in kdelibs
messages:
	$(XGETTEXT) *.cpp -o $(podir)/ksplash.pot


