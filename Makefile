PREFIX	:= $(HOME)
SRC_DIR := $(CURDIR)
CONF	:= $(PREFIX)/.dotfilesrc

LN	:= ln -fFs

#REMOTE	:=
#BRANCH	:=

SRC	:= $(patsubst $(SRC_DIR)/%/Makefile,%,$(wildcard $(SRC_DIR)/*/Makefile))

all:	help

install: $(SRC) install-conf update-submodules

$(SRC):
	@echo "Install $@..."
	@@if [ -f $(SRC_DIR)/$@/Makefile ]; then \
		cd $(SRC_DIR)/$@/ && make; \
	fi

clean:	clean-src clean-conf

pull:	pull-submodules
	@echo "Pull..."
	@@git pull ${REMOTE} ${BRANCH}


clean-src:
	@@for src in $(SRC); do \
		echo "Uninstall $${src}..."; \
		cd $(SRC_DIR)/$${src} && make clean; \
	done


install-conf:
	@@if [ ! -f $(CONF) ]; then \
		echo "Install config file..."; \
		echo "export DOTDIR="$(CURDIR) >> $(CONF); \
		echo "write: "$(CONF); \
	fi;
clean-conf:
	@echo "Uninstall config file..."
	@$(RM) $(CONF)
	@echo "rm: "$(CONF)


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
