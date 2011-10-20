PREFIX	:= $(HOME)
CONF	:= $(PREFIX)/.dotfilesrc

#REMOTE	:=
#BRANCH	:=

SRC	:= $(patsubst $(CURDIR)/%/Makefile,%,$(wildcard $(CURDIR)/*/Makefile))

all:	help

install: $(SRC) install-conf update-submodules

$(SRC):
	@@if [ -f $(CURDIR)/$@/Makefile ]; then \
		echo "Install $@..."; \
		cd $(CURDIR)/$@/ && make; \
	fi

clean:	clean-src clean-conf

pull:	pull-submodules
	@echo "Pull..."
	@@git pull ${REMOTE} ${BRANCH}

clean-src:
	@@for src in $(SRC); do \
		echo "Uninstall $${src}..."; \
		cd $(CURDIR)/$${src} && make clean; \
	done

install-conf:
	@@if [ ! -f $(CONF) ]; then \
		echo "Install config file..."; \
		echo "export DOTDIR="$(CURDIR) >> $(CONF); \
		echo "write: "$(CONF); \
	fi;

clean-conf:
	@echo "Uninstall config file..."
	@rm -fv $(CONF)

update-submodules:
	@echo "Update submodules..."
	@@if [ -d .git ]; then \
		if git submodule status | grep -q -E '^-'; then \
			git submodule update --init --recursive; \
		else \
			git submodule update --init --recursive --merge; \
		fi; \
	fi;

pull-submodules:
	@echo "Pull submodules..."
	@@git submodule foreach "git pull \$$(git config remote.origin.url)"
	@@git submodule summary

help:
	@echo "usage:	make [targets]"
	@echo "available [targets] are:"
	@echo "  install		: install all"
	@echo "  [subpackage name]	: install subpackage"
	@echo "  clean			: uninstall all"
	@echo "  pull			: pull from repository"
	@echo "  update-submodules	: init submodules"
	@echo "  pull-submodules	: pull submodules"
	@echo "  help			: show this text"

.PHONY: all install package clean pull clean-src install-conf clean-conf update-submodules pull-submodules $(SRC)
