# contrib/passwordpolicy/Makefile

EXTENSION = passwordpolicy
MODULE_big = passwordpolicy
OBJS = passwordpolicy.o $(WIN32RES)
PGFILEDESC = "passwordpolicy - strengthen user password checks"

DATA = passwordpolicy--1.0.0.sql

REGRESS_OPTS  = --inputdir=test --outputdir=test --load-extension=passwordpolicy --user=postgres
REGRESS = passwordpolicy_test

PG_CPPFLAGS = -DUSE_CRACKLIB '-DCRACKLIB_DICTPATH="/usr/lib/cracklib_dict"'
SHLIB_LINK = -lcrack

PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)