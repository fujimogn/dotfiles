CURDIR := "$(shell cygpath -w $(CURDIR))"
PREFIX ?= "$(HOMEPATH)"\\Documents
LN		= cmd /c mklink
LNF		= cmd /c mklink /d
RM      = cmd /c rm -rfv
S       = "\\"

SRCS   ?= AutoHotkey AutoHotkey.ahk

all:	install

install: \
		install-srcs

clean:	clean-srcs

install-srcs:
	@for F in $(SRCS); do \
		[ -x /usr/bin/iconv ] && [ $${LANG##*.} = "UTF-8" ] && CONV=" | iconv -f SJIS -t $${LANG##*.}"; \
		if [ -f $${F} ]; then \
			$(RM) $(PREFIX)$(S)$${F} && $(LN) $(PREFIX)$(S)$${F} $(CURDIR)$(S)$${F}$${CONV}; \
		elif [ -d $${F} ]; then \
			$(RM) $(PREFIX)$(S)$${F} && $(LNF) $(PREFIX)$(S)$${F} $(CURDIR)$(S)$${F}$${CONV}; \
		fi; \
	done

clean-srcs:
	@for F in $(SRCS); do \
		$(RM) $(PREFIX)$(S)$${F}; \
	done

.PHONY: all install clean install-srcs clean-srcs