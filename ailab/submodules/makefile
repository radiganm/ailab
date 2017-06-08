#!/usr/bin/make
## makefile
## Copyright 2016 Mac Radigan
## All Rights Reserved

.PHONY: submodules clean clobber update install
.DEFAULT_GOAL := submodules

submodules:
	$(MAKE) -C ./librad -f bootstrap.mk

update:
	git submodule init && git submodule update --recursive --remote
	$(MAKE) -C ./librad -f bootstrap.mk $@

install:
	$(MAKE) -C ./librad -f bootstrap.mk $@
	$(MAKE) -C ./asdf-central-registry $@

clean:
	$(MAKE) -C librad $@

clobber: clean
	$(MAKE) -C librad distclean

## *EOF*
