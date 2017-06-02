#!/bin/sh
## boostrap.sh (for autotools)
## Mac Radigan

       make -C ./ailab/submodules pre-install
       make -C ./ailab/submodules post-install
  sudo make -C ./ailab/submodules/librad install
       export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/local/lib
       make -C ./ailab

## *EOF*
