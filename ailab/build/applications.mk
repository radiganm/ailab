#!/usr/bin/make
## makefile (for AILAB applications)
## Copyright 2016 Mac Radigan
## All Rights Reserved

.PHONY: clean clobber
.DEFAULT_GOAL := all

include ./build/rules.mk

all: build

APPS = 
BINS = $(patsubst $(APPDIR)/%,$(BINDIR)/%, $(APPS:.cpp=))

# $(APPDIR)/swank.lisp   
# $(APPDIR)/lisp.lisp    
# $(APPDIR)/ailab.lisp   
# $(APPDIR)/test.lisp

CLAPPS = \
  $(APPDIR)/ailab.lisp
CLBINS = $(patsubst $(APPDIR)/%,$(BINDIR)/%, $(CLAPPS:.lisp=))

CYAPPS = 
CYBINS = $(patsubst $(APPDIR)/%,$(BINDIR)/%, $(CYAPPS:.pyx=))

build: init $(CLBINS)

$(BINDIR)/ailab: $(APPDIR)/ailab.lisp
	./build/sbclc -o $@ -c $^

$(BINDIR)/lisp: $(APPDIR)/lisp.lisp
	./build/sbclc -o $@ -c $^

$(BINDIR)/swank: $(APPDIR)/swank.lisp
	./build/sbclc -o $@ -c $^

$(BINDIR)/test: $(APPDIR)/test.lisp
	./build/sbclc -o $@ -c $^

clobber: clean
	-rm -f $(BINS)
	-rm -f $(CLBINS)
	-rm -f $(BINDIR)/system

## *EOF*
