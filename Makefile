# contrib/passwordpolicy/Makefile

EXTENSION = passwordpolicy
DATA = passwordpolicy--1.0.0.sql

REGRESS_OPTS  = --inputdir=test --outputdir=test --load-extension=passwordpolicy --user=postgres
REGRESS = passwordpolicy_test

MODULES = passwordpolicy          # our c module file to build

PG_CPPFLAGS = -DUSE_CRACKLIB '-DCRACKLIB_DICTPATH="/usr/lib/cracklib_dict"'
SHLIB_LINK = -lcrack

PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)
