ifeq ($(OS),Cygwin)
else
PROF_PREFIX	= $(HOME)/Library/Application\ Support/Firefox
PROF_DIR	= $(shell cat $(PROF_PREFIX)/profiles.ini | grep "Path=" | sed 's/^Path=//')
PREFIX		= $(PROF_PREFIX)/$(PROF_DIR)
endif

SYMLINKS = gm_scripts userChrome.css user.js

include ../../Makefile.rule
