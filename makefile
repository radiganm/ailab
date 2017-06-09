#!/usr/bin/make -f
## makefile (for AILab)
## Copyright 2016 Mac Radigan
## All Rights Reserved

.PHONY: clean clobber submodules applications bootstrap update install
.DEFAULT_GOAL := all

BLDDIR=./build

docker-args := -it -P -p4005:4005 -v /dev:/dev -v /tmp:/tmp -ipc host -net host

all: applications

submodules:
	$(MAKE) -C ailab $@

applications:
	$(MAKE) -C ailab -f $(BLDDIR)/$@.mk

clean:
	$(MAKE) -C ailab -f $(BLDDIR)/applications.mk $@

clobber:
	$(MAKE) -C ailab -f $(BLDDIR)/applications.mk $@

name = radiganm/ailab

docker-build: 
	docker build -t $(name) .

docker-shell: 
	docker run $(docker-args) $(name) util shell

docker-run: 
	docker run $(docker-args) $(name) ailab

docker-clean: 
	docker ps -a --no-trunc | grep $(name) | awk '{print$$1}' | xargs -I{} docker stop {}
	docker images -a --no-trunc | grep $(name) | awk '{print$$3}' | xargs -I{} docker rmi -f {}

bootstrap:
	$(MAKE) -C ./ailab/submodules
	sudo $(MAKE) -C ./ailab/submodules/librad install
	$(MAKE) -C ./ailab

install:
	$(MAKE) -C ailab $@

update:
	$(MAKE) -C ./ailab/submodules update

## *EOF*
