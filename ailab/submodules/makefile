#!/usr/bin/make -f
## makefile
## Copyright 2016 Mac Radigan
## All Rights Reserved

.PHONY: submodules clean clobber update install librad shen-sbcl tecla
.DEFAULT_GOAL := submodules

submodules: librad shen-sbcl tecla

librad:
	$(MAKE) -C ./librad -f bootstrap.mk

shen-sbcl:
	$(MAKE) -C ./shen-sbcl

tecla:
	$(MAKE) -C ./tecla -f bootstrap.mk

update:
	git submodule init && git submodule update --recursive --remote
	$(MAKE) -C ./librad -f bootstrap.mk $@

install:
	$(MAKE) -C ./librad -f bootstrap.mk $@
	$(MAKE) -C ./asdf-central-registry $@
	$(MAKE) -C ./shen-sbcl $@
	-$(MAKE) -C ./tecla -f bootstrap.mk $@
	(cd ./tecla; cp -f enhance /usr/local/bin)

clean:
	$(MAKE) -C librad $@

clobber: clean
	$(MAKE) -C librad distclean

## *EOF*
