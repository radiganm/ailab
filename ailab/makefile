#!/usr/bin/make -f
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
	sudo mkdir -p /opt/local/bin && sudo cp -f ./scripts/system /opt/local/bin
	sudo mkdir -p /opt/local/bin && sudo cp -f ./bin/ailab  /opt/local/bin

applications:
	$(MAKE) -f $(BLDDIR)/$@.mk

clean:
	$(MAKE) -f $(BLDDIR)/applications.mk $@

clobber:
	$(MAKE) -f $(BLDDIR)/applications.mk $@

## *EOF*
