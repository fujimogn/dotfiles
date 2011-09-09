.SUFFIXES: .symlink

PREFIX	:= ~/
SRCS	:= $(patsubst ./%,%,$(basename $(wildcard ./*/*.symlink)))
CONF	:= $(PREFIX).dotfilesrc
LN	:= ln -fFs
T	:="	"

all:	install-srcs \
	install-conf \
	update-submodules


install-srcs:
	@echo "ln: symlink"
	@for file in $(SRCS); do \
		echo $(T)"ln: "$$file".symlink -> "$(PREFIX).$${file##*/}; \
		$(LN) $(CURDIR)/$$file.symlink $(PREFIX).$${file##*/}; \
	done

install-conf:
	@@if [ ! -f $(CONF) ]; then \
		echo "make: rcfile"; \
		touch $(CONF); \
		echo "export DOTDIR="$(CURDIR) >> $(CONF); \
		echo $(T)"write: "$(CONF); \
	fi;

update-submodules:
	@@if [ -d .git ]; then \
		if git submodule status | grep -q -E '^-'; then \
			git submodule update --init --recursive; \
		else \
			git submodule update --init --recursive --merge; \
		fi; \
	fi;

pull-submodules:
	@@git submodule foreach "git pull \$$(git config remote.origin.url)"
	@@git submodule summary

pull:	pull_submodules
	@@git pull ${REMOTE} ${BRANCH}

clean:	clean-srcs \
	clean-conf

clean-srcs:
	@echo "rm: symlink"
	@for file in $(SRCS); do \
		rm -rf $(PREFIX).$${file##*/}; \
		echo $(T)"rm: "$(PREFIX).$${file##*/}; \
	done

clean-conf:
	@echo "rm: config"
	@$(RM) $(CONF)
	@echo $(T)"rm: "$(CONF)


help:
	@echo "usage:	make [targets]"
	@echo "available [targets] are:"
	@echo "  intsall		: install all"
	@echo "  clean			: uninstall all"
	@echo "  update-submodules	: init submodules"
	@echo "  pull-submodules	: pull submodules"
	@echo "  pull			: pull from repository"
	@echo "  help			: show this text"

.PHONY: all core backup install package clean pull pull-submodules update-submodules
