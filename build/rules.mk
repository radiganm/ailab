#!/usr/bin/make
## makefile (for libsystem)
## Copyright 2016 Mac Radigan
## All Rights Reserved

.PHONY: clean clobber init
.DEFAULT_GOAL := all

all: build

VPATH = ./src:./src/modules

CCC = g++
FC = gfortran
CYC = cython

BINDIR    = ./bin
SRCDIR    = ./src
LIBDIR    = ./lib
TESTDIR   = ./tests
SCRIPTDIR = ./scripts
FMODDIR   = ./mod
MODDIR    = ./$(SRCDIR)/modules
APPDIR    = ./$(SRCDIR)/apps
TESTSDIR  = ./$(SRCDIR)/tests
SUBDIR    = ./submodules

TARGET = ailab

LIBS = \
  $(LIBDIR)/lib$(TARGET).a  \
  $(LIBDIR)/lib$(TARGET).so

ARCH = -m64
ININC = \
  -I$(SUBDIR)/tecla \
  -I$(SUBDIR)/ecl/build
EXINC = \
  -I/usr/include/readline
INC = -I./include
CFLAGS = -fPIC -O2 $(ARCH) -g3 $(INC) $(ININC) $(EXINC)
C11FLAGS = -fPIC -O2 $(ARCH) -g3 -std=c++11 $(INC) $(ININC) $(EXINC)
FFLAGS = -J$(FMODDIR) -cpp -fPIC -O2 $(ARCH) -g3 $(INC) $(ININC)
LIBPATH = \
  -L/lib/x86_64-linux-gnu \
  -L/usr/lib/x86_64-linux-gnu \
  -L$(SUBDIR)/tecla \
  -L$(SUBDIR)/dispmodule/lib \
  -L$(SUBDIR)/ecl/build \
  -L/usr/lib/x86_64-linux-gnu/root5.34
EXLIBS = \
  -lm \
  -ldl \
  -pthread \
  -lfftw3 \
  -lgmp \
  -latomic \
  -lcurses \
  -lreadline \
  -llapack \
  -lblas \
  -ldispmodule
INLIBS = \
  -lecl
#LDFLAGS = -O2 $(ARCH) -g $(LIBPATH) $(INLIBS) $(EXLIBS) $(LIBDIR)/lib$(TARGET).a
LDFLAGS = -O2 $(ARCH) -g $(LIBPATH) $(LIBDIR)/lib$(TARGET).a ./submodules/dispmodule/lib/libdispmodule.a $(INLIBS) $(EXLIBS) 

# -ldispmodule
# -l:libeclmin.a  
# -l:libecl-cdb.a  
# -l:libecl-curl.a  
# -l:libecl-help.a  
# -l:libasdf.a  
# -l:libcmp.a  
# -l:libdeflate.a  
# -l:libdefsystem.a  
# -l:liblsp.a  
# -l:libpackage-locks.a  
# -l:libprofile.a  
# -l:libql-minitar.a  
# -l:librt.a  
# -l:libsb-bsd-sockets.a  
# -l:libserve-event.a  
# -l:libsockets.a

init:
	@-mkdir -p $(BINDIR)
	@-mkdir -p $(LIBDIR)
	@-mkdir -p $(TESTDIR)
	@-mkdir -p $(FMODDIR)
	@-(cd $(BINDIR); ln -fs ../$(SCRIPTDIR)/system .)

%.oC11: %.cpp
	$(CCC) $(C11FLAGS) -c -o $@ $^

%.oF90: %.f90
	$(FC) $(FFLAGS) -c -o $@ $^

## *EOF*
