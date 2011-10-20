userlib:=~/Library/Application\ Support/KeyRemap4MacBook
prefpane:=/Library/org.pqrs/KeyRemap4MacBook/prefpane

all:	install

install:
	@if [ -d $(userlib) ]; then \
		ln -sfv $(CURDIR)/private.xml $(userlib)/private.xml; \
	fi
	@if [ -d $(prefpane) ]; then \
		if [ -f $(prefpane)/number.xml ] && [ ! -L $(prefpane)/number.xml ]; then \
			sudo cp -v $(prefpane)/number.xml $(prefpane)/number.xml.old~ && \
			echo "backup: $(prefpane)/number.xml.old~ "; \
		fi; \
		sudo ln -sfv $(CURDIR)/number.xml $(prefpane)/number.xml; \
	fi

clean:
	@if [ -d $(userlib) ]; then \
		rm -fv $(userlib)/private.xml; \
	fi
	@if [ -d $(prefpane) ]; then \
		if [ -f $(prefpane)/number.xml ] && [ -L $(prefpane)/number.xml ]; then \
			sudo rm -fv $(prefpane)/number.xml; \
		fi; \
		if [ -f $(prefpane)/number.xml.old~ ]; then \
			sudo mv $(prefpane)/number.xml.old~ $(prefpane)/number.xml && \
			echo "restore: $(prefpane)/number.xml"; \
		fi; \
	fi

.PHONY: all install clean
