include ../Makefile.rule

SRCS	= .vim .vimrc .gvimrc

install: install-srcs install-mvim
clean: clean-srcs clean-mvim

install-mvim:
	@sh $(CURDIR)/mvim.sh

clean-mvim:
	@sh $(CURDIR)/mvim.sh clean

.PHONY: install-mvim clean-mvim
