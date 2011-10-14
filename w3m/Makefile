PREFIX	:= $(HOME)
SRCS	:= .w3m
OS:=$(shell uname -o)

all:	install

install:install-srcs

clean:	clean-srcs

install-srcs:
	@for file in $(SRCS); do \
		if [ -e $$file ] && [ -e $(PREFIX) ]; then\
			if [ "$(OS)" = "Cygwin" ]; then \
				rm -rfv $(PREFIX)/$${file##*/}; \
				[ -f $$file  ] && cmd /C mklink `cygpath -w $(PREFIX)`\\$${file##*/} `cygpath -w $(CURDIR)`\\$$file; \
				[ -d $$file  ] && cmd /C mklink /d `cygpath -w $(PREFIX)`\\$${file##*/} `cygpath -w $(CURDIR)`\\$$file; \
				echo ""; \
			else \
				[ -f $$file  ] && ln -sfv $(CURDIR)/$$file $(PREFIX)/$${file##*/}; \
				[ -d $$file  ] && ln -snfv $(CURDIR)/$$file $(PREFIX)/$${file##*/}; \
			fi;\
		fi;\
	done

clean-srcs:
	@for file in $(SRCS); do \
		rm -rfv $(PREFIX)/$${file##*/}; \
	done

.PHONY: all install clean install-srcs clean-srcs
