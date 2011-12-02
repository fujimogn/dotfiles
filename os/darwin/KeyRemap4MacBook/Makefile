userlib:=~/Library/Application\ Support/KeyRemap4MacBook

all:	install

install:
	@if [ -d $(userlib) ]; then \
		ln -sfv $(CURDIR)/private.xml $(userlib)/private.xml; \
	fi

clean:
	@if [ -d $(userlib) ]; then \
		rm -fv $(userlib)/private.xml; \
	fi

.PHONY: all install clean
