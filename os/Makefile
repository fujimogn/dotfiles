PREFIX	:= $(HOME)
OS	:= $(shell uname)

ifeq ($(OS), Linux)
SRC	= linux
endif
ifeq ($(OS), Darwin)
SRC	= darwin
endif
ifeq ($(OS), Cygwin)
SRC	= cygwin
endif

all:	install

install:
	@if [ -f $(CURDIR)/$(SRC)/Makefile ]; then \
		echo "Install $(SRC)..."; \
		cd $(CURDIR)/$(SRC) && make; \
	fi

clean:
	@if [ -f $(CURDIR)/$(SRC)/Makefile ]; then \
		echo "Unintall $(SRC)..."; \
		cd $(CURDIR)/$(SRC) && make clean; \
	fi

.PHONY: all install clean
