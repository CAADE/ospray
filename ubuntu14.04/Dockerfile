FROM ubuntu:14.04

ENV ISPC_VERSION="1.9.1"

RUN apt update
RUN apt -y upgrade
RUN apt -y install wget cmake g++ clang git libtbb-dev libopenmpi-dev libgl1-mesa-dev libxrandr-dev libxinerama-dev libxcursor-dev
RUN mkdir /gitlab

ENV HOME=/gitlab

# All builds will be done in home dir
WORKDIR $HOME

# Download and unpack ISPC
RUN wget https://downloads.sourceforge.net/project/ispcmirror/v$ISPC_VERSION/ispc-v$ISPC_VERSION-linux.tar.gz && tar -xaf ispc-v$ISPC_VERSION-linux.tar.gz && rm ispc-v$ISPC_VERSION-linux.tar.gz

ENV PATH $PATH:$HOME/ispc-v${ISPC_VERSION}-linux

# Build and install embree
RUN git clone http://github.com/embree/embree.git embree-src && mkdir embree-src/build
RUN cd embree-src/build && cmake -DCMAKE_INSTALL_PREFIX=/gitlab/embree -DCMAKE_INSTALL_LIBDIR=lib -DEMBREE_GEOMETRY_HAIR=OFF -DEMBREE_GEOMETRY_LINES=OFF -DEMBREE_GEOMETRY_QUADS=OFF -DEMBREE_GEOMETRY_SUBDIV=OFF -DEMBREE_TUTORIALS=OFF -DEMBREE_MAX_ISA=AVX2 .. && make -j`nproc` install
RUN rm -rf $HOME/embree-src

ENV embree_DIR=$HOME/embree

CMD ["/bin/bash"]
