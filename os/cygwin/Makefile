PREFIX	:= $(HOME)

SRC	:= $(patsubst $(CURDIR)/%/Makefile,%,$(wildcard $(CURDIR)/*/Makefile))

install: $(SRC)

$(SRC):
	@@if [ -f $(CURDIR)/$@/Makefile ]; then \
		echo "Install $@..."; \
		cd $(CURDIR)/$@/ && make; \
	fi

clean:	clean-src

clean-src:
	@@for src in $(SRC); do \
		echo "Uninstall $${src}..."; \
		cd $(CURDIR)/$${src} && make clean; \
	done

.PHONY: all install clean clean-src $(SRC)