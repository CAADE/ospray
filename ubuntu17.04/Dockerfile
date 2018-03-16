FROM ubuntu:17.04

ENV ISPC_VERSION="1.9.2"
ENV EMBREE_VERSION="2.17.4"

RUN apt update
RUN apt -y upgrade
RUN apt -y install wget cmake g++ clang git libtbb-dev libglfw3-dev libopenmpi-dev alien
RUN mkdir /gitlab

ENV HOME=/gitlab

# All builds will be done in home dir
WORKDIR $HOME

# Download and unpack ISPC
RUN wget https://downloads.sourceforge.net/project/ispcmirror/v$ISPC_VERSION/ispc-v$ISPC_VERSION-linux.tar.gz && tar -xaf ispc-v$ISPC_VERSION-linux.tar.gz && rm ispc-v$ISPC_VERSION-linux.tar.gz

ENV PATH $PATH:$HOME/ispc-v${ISPC_VERSION}-linux

# Download and install embree
RUN wget https://github.com/embree/embree/releases/download/v$EMBREE_VERSION/embree-$EMBREE_VERSION.x86_64.rpm.tar.gz && \
     tar -xvf embree-$EMBREE_VERSION.x86_64.rpm.tar.gz && \
     alien --scripts *.rpm && \
     dpkg -i *.deb && \
     rm embree-$EMBREE_VERSION.x86_64.rpm.tar.gz *.rpm *.deb
ENV embree_DIR /usr/lib64/cmake/embree-$EMBREE_VERSION

# Embree is installed in /usr/lib64 so we have to add it to LD_LIBRARY_PATH
ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/usr/lib64/

CMD ["/bin/bash"]
