#!/usr/bin/make
## makefile
## Copyright 2016 Mac Radigan
## All Rights Reserved

.PHONY: submodules clean clobber pre-install post-install update
.DEFAULT_GOAL := submodules

submodules: pre-install
	(cd ./librad; ./configure --prefix=/opt/local && $(MAKE))

update:
	./update.sh
	$(MAKE) -C ./librad $@

pre-install:

post-install: submodules
	(mkdir -p ../lib; cd ../lib; ln -fs ../submodules/librad/.libs/* .)

clean:
	$(MAKE) -C librad $<

clobber: clean
	$(MAKE) -C librad distclean

## *EOF*
