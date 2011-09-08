.SUFFIXES: .symlink

LN	:= ln -fFs
SRCS	:= $(basename $(wildcard ./**/*.symlink))
INSTDIR	:= ~
TAB	:= "	"

all	: install

install	: install-symlink

install-symlink	: $(SRCS)

$(SRCS)	:
	@$(LN) $(CURDIR)/$(addsuffix .symlink, $@) $(INSTDIR)/.$(notdir $@)
	@echo $(TAB)"ln: "$@".symlink -> "$(INSTDIR)/.$(notdir $@)

clean	: clean-symlink

clean-symlink	: 
	@$(RM) $(INSTDIR)/.$(notdir $(SRCS))
	@echo $(TAB)"rm: "$(INSTDIR)/.$(notdir $(SRCS))

help:
	@echo "	$(SRCS)"
