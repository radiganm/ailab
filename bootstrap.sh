#!/bin/sh
## boostrap.sh (for autotools)
## Mac Radigan

  make -C ./submodules post-install
  autoreconf --force --install

## *EOF*
