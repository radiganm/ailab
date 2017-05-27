#!/bin/sh
## boostrap.sh (for autotools)
## Mac Radigan

  make -C ./ailab/submodules pre-install
  make -C ./ailab/submodules post-install
  make -C ./ailab

## *EOF*
