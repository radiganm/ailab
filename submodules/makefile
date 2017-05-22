#!/usr/bin/make
## makefile
## Copyright 2016 Mac Radigan
## All Rights Reserved

.PHONY: submodules clean clobber
.DEFAULT_GOAL := submodules

submodules: pre-install
	(cd ./librad; ./configure && $(MAKE))

pre-install:
	./update.sh
	(cd ./librad; ./bootstrap.sh)

post-install: submodules
	(mkdir -p ../lib; cd ../lib; ln -fs ../submodules/librad/.libs/* .)

clean:
	$(MAKE) -C librad $<

clobber: clean
	$(MAKE) -C librad distclean

## *EOF*
