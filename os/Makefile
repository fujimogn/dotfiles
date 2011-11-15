PREFIX	:= $(HOME)

OSTYPE = $(shell uname)

ifeq ($(OSTYPE),FreeBSD)
SRC	= freebsd
endif

ifeq ($(OSTYPE),Linux)
SRC	= linux
endif

ifeq ($(OSTYPE),Darwin)
SRC	= darwin
endif

ifeq ($(OS),Windows_NT)
SRC	= cygwin
endif

ifeq ($(OSTYPE),cygwin)
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
