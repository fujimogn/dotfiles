OS	= $(shell uname)

ifeq ($(OS),FreeBSD)
CHILDS	= freebsd
endif
ifeq ($(OS),Linux)
CHILDS	= linux
endif
ifeq ($(OS),Darwin)
CHILDS	= darwin
endif
ifeq ($(OS),Windows_NT)
CHILDS	= cygwin
endif
ifeq ($(OS),cygwin)
CHILDS	= cygwin
endif

include ../Makefile.rule
