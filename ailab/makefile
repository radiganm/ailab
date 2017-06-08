#!/usr/bin/make
## makefile (for AILab)
## Copyright 2016 Mac Radigan
## All Rights Reserved

.PHONY: clean clobber submodules applications install
.DEFAULT_GOAL := all

BLDDIR=./build

all: applications

submodules:
	$(MAKE) -C $@

install:
	$(MAKE) -C submodules install

applications:
	$(MAKE) -f $(BLDDIR)/$@.mk

clean:
	$(MAKE) -f $(BLDDIR)/applications.mk $@

clobber:
	$(MAKE) -f $(BLDDIR)/applications.mk $@

## *EOF*
