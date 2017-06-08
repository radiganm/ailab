#!/usr/bin/make
## makefile
## Copyright 2016 Mac Radigan
## All Rights Reserved

.PHONY: submodules clean clobber update install librad shen-sbcl
.DEFAULT_GOAL := submodules

submodules: librad shen-sbcl

librad:
	$(MAKE) -C ./librad -f bootstrap.mk

shen-sbcl:
	$(MAKE) -C ./shen-sbcl

update:
	git submodule init && git submodule update --recursive --remote
	$(MAKE) -C ./librad -f bootstrap.mk $@

install:
	$(MAKE) -C ./librad -f bootstrap.mk $@
	$(MAKE) -C ./asdf-central-registry $@
	$(MAKE) -C ./shen-sbcl $@

clean:
	$(MAKE) -C librad $@

clobber: clean
	$(MAKE) -C librad distclean

## *EOF*
