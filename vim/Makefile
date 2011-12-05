SYMLINKS	= .vim .vimrc .gvimrc
include ../Makefile.rule

install: install-mvim
clean: clean-mvim

install-mvim:
	@sh $(CURDIR)/mvim.sh

clean-mvim:
	@sh $(CURDIR)/mvim.sh clean

.PHONY: install-mvim clean-mvim
