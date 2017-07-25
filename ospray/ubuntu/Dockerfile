FROM ubuntu:16.04

ENV ISPC_VERSION="1.9.1"
ENV EMBREE_VERSION="2.16.4"

RUN apt update
RUN apt -y upgrade
RUN apt -y install wget cmake g++ clang git libtbb-dev libglfw3-dev libopenmpi-dev
RUN mkdir /gitlab

ENV HOME=/gitlab

# All builds will be done in home dir
WORKDIR $HOME

# Download and unpack ISPC
RUN wget https://downloads.sourceforge.net/project/ispcmirror/v$ISPC_VERSION/ispc-v$ISPC_VERSION-linux.tar.gz && tar -xaf ispc-v$ISPC_VERSION-linux.tar.gz && rm ispc-v$ISPC_VERSION-linux.tar.gz

ENV PATH $PATH:$HOME/ispc-v${ISPC_VERSION}-linux

# Build and install embree
RUN git clone http://github.com/embree/embree.git embree-src && mkdir embree-src/build
RUN cd embree-src/build && cmake -DCMAKE_INSTALL_PREFIX=/gitlab/embree -DEMBREE_GEOMETRY_HAIR=OFF -DEMBREE_GEOMETRY_LINES=OFF -DEMBREE_GEOMETRY_QUADS=OFF -DEMBREE_GEOMETRY_SUBDIV=OFF -DEMBREE_TUTORIALS=OFF -DEMBREE_MAX_ISA=AVX2 .. && make -j`nproc` install
RUN rm -rf $HOME/embree-src

ENV embree_DIR=$HOME/embree

CMD ["/bin/bash"]
