PREFIX	:= $(HOME)

APP	:= $(shell basename $(CURDIR))

SRCS	:=
DIR	:= $(PREFIX)/Library/$(APP)

APPSSRCS:= Settings.plist
APPSDIR := $(PREFIX)/Library/Application\ Support/$(APP)

PREFSRCS:=
PREFDIR:= $(PREFIX)/Library/Preferences

all: install

install: $(foreach f, $(SRCS), install-src-$(f)) \
	 $(foreach f, $(APPSSRCS), install-apps-$(f)) \
	 $(foreach f, $(PREFSRCS), install-pref-$(f))

install-src-%: %
	@ln -sfv $(CURDIR)/$(<) $(DIR)/$(<)

install-apps-%: %
	@ln -sfv $(CURDIR)/$(<) $(APPSDIR)/$(<)

install-pref-%: % check-prefdir
	@if [ -f "$(PREFDIR)/$(<).lockfile" ]; then \
		rm -f $(PREFDIR)/$(<).lockfile; \
	fi
	@ln -sfv $(CURDIR)/$(<) $(PREFDIR)/$(<)

check-prefdir:
	@if [ ! -d $(LIBDIR) ]; then \
		mkdir $(LIBDIR); \
	fi

clean: $(foreach f, $(SRCS), clean-src-$(f)) \
       $(foreach f, $(APPSSRCS), clean-apps-$(f)) \
       $(foreach f, $(PREFSRCS), clean-pref-$(f))

clean-src-%: %
	@rm -fv $(DIR)/$(<)

clean-apps-%: %
	@rm -fv $(APPSDIR)/$(<)

clean-pref-%: %
	@rm -fv $(PREFDIR)/$(<)

.PHONY: all install check-libdir clean
