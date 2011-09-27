all:	install

install:
	@if [ -d $(HOME)/Library/Application\ Support/KeyRemap4MacBook ]; then \
		ln -snf $(CURDIR)/private.xml $(HOME)/Library/Application\ Support/KeyRemap4MacBook/private.xml && echo "ln: $(CURDIR)/private.xml -> $(HOME)/Library/Application\ Support/KeyRemap4MacBook/private.xml"; \
	fi
	@if [ -d /Library/org.pqrs/KeyRemap4MacBook/prefpane ]; then \
		if [ -f /Library/org.pqrs/KeyRemap4MacBook/prefpane/number.xml ] && [ ! -L /Library/org.pqrs/KeyRemap4MacBook/prefpane/number.xml ]; then \
			sudo cp /Library/org.pqrs/KeyRemap4MacBook/prefpane/number.xml /Library/org.pqrs/KeyRemap4MacBook/prefpane/number.xml.old~ && echo "backup: /Library/org.pqrs/KeyRemap4MacBook/prefpane/number.xml.old~ "; \
		fi; \
		sudo ln -snf $(CURDIR)/number.xml /Library/org.pqrs/KeyRemap4MacBook/prefpane/number.xml && echo "ln: $(CURDIR)/number.xml -> /Library/org.pqrs/KeyRemap4MacBook/prefpane/number.xml"; \
	fi

clean:
	@if [ -d $(HOME)/Library/Application\ Support/KeyRemap4MacBook ]; then \
		rm -f $(HOME)/Library/Application\ Support/KeyRemap4MacBook/private.xml && echo "rm: $(HOME)/Library/Application\ Support/KeyRemap4MacBook/private.xml"; \
	fi
	@if [ -d /Library/org.pqrs/KeyRemap4MacBook/prefpane ]; then \
		if [ -f /Library/org.pqrs/KeyRemap4MacBook/prefpane/number.xml ] && [ -L /Library/org.pqrs/KeyRemap4MacBook/prefpane/number.xml ]; then \
			sudo rm -f /Library/org.pqrs/KeyRemap4MacBook/prefpane/number.xml && echo "rm: /Library/org.pqrs/KeyRemap4MacBook/prefpane/number.xml"; \
		fi; \
		if [ -f /Library/org.pqrs/KeyRemap4MacBook/prefpane/number.xml.old~ ]; then \
			sudo mv /Library/org.pqrs/KeyRemap4MacBook/prefpane/number.xml.old~ /Library/org.pqrs/KeyRemap4MacBook/prefpane/number.xml && echo "restore: /Library/org.pqrs/KeyRemap4MacBook/prefpane/number.xml"; \
		fi; \
	fi

.PHONY: all install clean
