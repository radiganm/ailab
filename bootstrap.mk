#!/usr/bin/make
## bootstrap.mk (for AILab)
## Copyright 2016 Mac Radigan
## All Rights Reserved

.PHONY: bootstrap
.DEFAULT_GOAL := bootstrap

bootstrap:
	$(MAKE) -C ./ailab/submodules
	sudo $(MAKE) -C ./ailab/submodules/librad install
	$(MAKE) -C ./ailab

## *EOF*
