SUDO	= true
FILES	= rombouts.pdnsd.plist google-ime-skk.plist
PREFIX	= /Library/LaunchDaemons

include ../../../Makefile.rule

install-after:
	@for F in $(FILES); do \
		$(SUDO) launchctl load $(PREFIX)/$${F}; \
	done

clean-before:
	@for F in $(FILES); do \
		$(SUDO) launchctl unload $(PREFIX)/$${F}; \
	done

