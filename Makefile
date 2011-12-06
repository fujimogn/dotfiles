include Makefile.rule

CONF	:= $(PREFIX)/.dotfilesrc

install: install-conf update-submodules

clean:	clean-childs clean-conf

install-conf:
	@@if [ ! -f $(CONF) ]; then \
		echo "Install config file..."; \
		echo "export DOTDIR="$(CURDIR) >> $(CONF); \
		echo "write: "$(CONF); \
	fi;

clean-conf:
	@echo "Uninstall config file..."
	@rm -fv $(CONF)

pull:	pull-submodules
	@echo "Pull..."
	@@git pull ${REMOTE} ${BRANCH}

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

.PHONY: pull install-conf clean-conf update-submodules pull-submodules
