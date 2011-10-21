OS	   := $(shell uname -o)
ifeq ($(OS),Cygwin)
CURDIR := "$(shell cygpath -w $(CURDIR))"
PREFIX ?= "$(shell cygpath -w $(HOME))"
LN		= cmd /c mklink
LNF		= cmd /c mklink /d
RM      = cmd /c rm -rfv
S       = "\\"
else
CURDIR := $(CURDIR)
PREFIX ?= $(HOME)
LN		= ln -sfv
LNF		= ln -snfv
RM      = rm -rfv
S       = "/"
endif

SRCS   ?= .minttyrc

all:	install

install:install-srcs

clean:	clean-srcs

install-srcs:
	@for F in $(SRCS); do \
		if [ "$(OS)" = "Cygwin" ]; then \
			[ -x /usr/bin/iconv ] && [ $${LANG##*.} = "UTF-8" ] && CONV=" | iconv -f SJIS -t $${LANG##*.}"; \
			if [ -f $${F} ]; then \
				$(RM) $(PREFIX)$(S)$${F} && $(LN) $(PREFIX)$(S)$${F} $(CURDIR)$(S)$${F}$${CONV}; \
			elif [ -d $${F} ]; then \
				$(RM) $(PREFIX)$(S)$${F} && $(LNF) $(PREFIX)$(S)$${F} $(CURDIR)$(S)$${F}$${CONV}; \
			fi; \
		else \
			if [ -f $${F} ]; then \
				$(LN) $(CURDIR)$(S)$${F} $(PREFIX)$(S)$${F}; \
			elif [ -d $${F} ]; then \
				$(LNF) $(CURDIR)$(S)$${F} $(PREFIX)$(S)$${F}; \
			fi; \
		fi; \
	done

clean-srcs:
	@for F in $(SRCS); do \
		$(RM) $(PREFIX)$(S)$${F}; \
	done

.PHONY: all install clean install-srcs clean-srcs