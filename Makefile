# contrib/passwordpolicy/Makefile

MODULE_big = passwordpolicy
OBJS = passwordpolicy.o $(WIN32RES)
PGFILEDESC = "passwordpolicy - strengthen user password checks"

# uncomment the following two lines to enable cracklib support
PG_CPPFLAGS = -DUSE_CRACKLIB '-DCRACKLIB_DICTPATH="/usr/lib/cracklib_dict"'
SHLIB_LINK = -lcrack

ifdef USE_PGXS
PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)
else
subdir = contrib/passwordpolicy
top_builddir = ../..
include $(top_builddir)/src/Makefile.global
include $(top_srcdir)/contrib/contrib-global.mk
endif
