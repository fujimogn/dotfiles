PREFIX	:= $(HOME)
SRCS	:= .gitconfig .gitignore_global

all:	install

install:install-srcs

clean:	clean-srcs

install-srcs:
	@for file in $(SRCS); do \
		if [ -e $$file ] && [ -e $(PREFIX) ]; then\
			[ -f $$file  ] && ln -sf $(CURDIR)/$$file $(PREFIX)/$${file##*/}; \
			[ -d $$file  ] && ln -snf $(CURDIR)/$$file $(PREFIX)/$${file##*/}; \
			echo "ln: "$(CURDIR)/$$file" -> "$(PREFIX)/$${file##*/}; \
		fi;\
	done

clean-srcs:
	@for file in $(SRCS); do \
		rm -rf $(PREFIX)/$${file##*/}; \
		echo "rm: "$(PREFIX)/$${file##*/}; \
	done

.PHONY: all install clean install-srcs clean-srcs
