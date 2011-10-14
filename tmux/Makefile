PREFIX	:= $(HOME)
SRCS	:= .tmux.conf
OS:=$(shell uname -o)

all:	install

install:install-srcs

clean:	clean-srcs

install-srcs:
	@for file in $(SRCS); do \
		if [ -e $$file ] && [ -e $(PREFIX) ]; then \
			if [ "$(OS)" = "Cygwin" ]; then \
				rm -rfv $(PREFIX)/$${file##*/}; \
				if [ -f $$file  ]; then \
					cmd /C mklink `cygpath -w $(PREFIX)`\\$${file##*/} `cygpath -w $(CURDIR)`\\$$file; \
				elif [ -d $$file  ]; then \
					cmd /C mklink /d `cygpath -w $(PREFIX)`\\$${file##*/} `cygpath -w $(CURDIR)`\\$$file; \
				fi; \
			else \
				if [ -f $$file  ]; then \
					ln -sfv $(CURDIR)/$$file $(PREFIX)/$${file##*/}; \
				elif [ -d $$file  ]; then \
					ln -snfv $(CURDIR)/$$file $(PREFIX)/$${file##*/}; \
				fi; \
			fi; \
		fi; \
	done

clean-srcs:
	@for file in $(SRCS); do \
		rm -rfv $(PREFIX)/$${file##*/}; \
	done

.PHONY: all install clean install-srcs clean-srcs
