userlib:=~/Library/Application\ Support/KeyRemap4MacBook
prefpane:=/Library/org.pqrs/KeyRemap4MacBook/prefpane

all:	install

install:
	@if [ -d $(userlib) ]; then \
		ln -snf $(CURDIR)/private.xml $(userlib)/private.xml && \
		echo "ln: $(CURDIR)/private.xml -> $(userlib)/private.xml"; \
	fi
	@if [ -d $(prefpane) ]; then \
		if [ -f $(prefpane)/number.xml ] && [ ! -L $(prefpane)/number.xml ]; then \
			sudo cp $(prefpane)/number.xml $(prefpane)/number.xml.old~ && \
			echo "backup: $(prefpane)/number.xml.old~ "; \
		fi; \
		sudo ln -snf $(CURDIR)/number.xml $(prefpane)/number.xml && \
		echo "ln: $(CURDIR)/number.xml -> $(prefpane)/number.xml"; \
	fi

clean:
	@if [ -d $(userlib) ]; then \
		rm -f $(userlib)/private.xml && \
		echo "rm: $(userlib)/private.xml"; \
	fi
	@if [ -d $(prefpane) ]; then \
		if [ -f $(prefpane)/number.xml ] && [ -L $(prefpane)/number.xml ]; then \
			sudo rm -f $(prefpane)/number.xml && \
			echo "rm: $(prefpane)/number.xml"; \
		fi; \
		if [ -f $(prefpane)/number.xml.old~ ]; then \
			sudo mv $(prefpane)/number.xml.old~ $(prefpane)/number.xml && \
			echo "restore: $(prefpane)/number.xml"; \
		fi; \
	fi

.PHONY: all install clean
