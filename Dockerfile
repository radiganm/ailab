## Dockerfile (for AILab)
## Mac Radigan

  FROM ubuntu:latest

  MAINTAINER Mac Radigan

  ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

  ## update APT
  RUN ulimit -n 1024
  RUN apt-get update --fix-missing

  ## install packages
  RUN apt-get update &&      \
      apt-get install -y     \
      git                    \
      build-essential        \
      gfortran               \
      fftw3-dev              \
      cmake                  \
      libgmp3-dev            \
      libatomic-ops-dev      \
      libfuse-dev            \
      libglew-dev            \
      freeglut3-dev          \
      libglm-dev             

  # install AILab
  COPY ./ailab /opt/ailab
  RUN make -C /opt/ailab/submodules
  RUN (cd /opt/ailab/submodules/librad && ./local-install.sh)
  RUN make -C /opt/ailab

  # clean up APT
  RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

  # entry point
  ADD ./ailab_ctl /usr/bin
  RUN chmod 775 /usr/bin/ailab_ctl
  ENTRYPOINT ["/usr/bin/ailab_ctl"]

## *EOF*