FROM ubuntu:16.04

ENV ISPC_VERSION="1.9.2"
ENV EMBREE2_VERSION="2.17.4"
ENV EMBREE3_VERSION="3.2.0"

RUN apt update
RUN apt -y upgrade
RUN apt -y install wget cmake g++ clang git libtbb-dev libglfw3-dev libopenmpi-dev alien
RUN apt -y remove libglfw3-dev #get glfw dependencies, but remove the library itself...
RUN mkdir /gitlab

ENV HOME=/gitlab

# All builds will be done in home dir
WORKDIR $HOME

# Download and unpack ISPC
RUN wget https://downloads.sourceforge.net/project/ispcmirror/v$ISPC_VERSION/ispc-v$ISPC_VERSION-linux.tar.gz && tar -xaf ispc-v$ISPC_VERSION-linux.tar.gz && rm ispc-v$ISPC_VERSION-linux.tar.gz

ENV PATH $PATH:$HOME/ispc-v${ISPC_VERSION}-linux

# Download and install embree
RUN wget https://github.com/embree/embree/releases/download/v$EMBREE2_VERSION/embree-$EMBREE2_VERSION.x86_64.rpm.tar.gz && \
     tar -xvf embree-$EMBREE2_VERSION.x86_64.rpm.tar.gz && \
     alien --scripts *.rpm && \
     dpkg -i *.deb && \
     rm embree-$EMBREE2_VERSION.x86_64.rpm.tar.gz *.rpm *.deb

RUN wget https://github.com/embree/embree/releases/download/v$EMBREE3_VERSION/embree-$EMBREE3_VERSION.x86_64.rpm.tar.gz && \
     tar -xvf embree-$EMBREE3_VERSION.x86_64.rpm.tar.gz && \
     alien --scripts *.rpm && \
     dpkg -i *.deb && \
     rm embree-$EMBREE3_VERSION.x86_64.rpm.tar.gz *.rpm *.deb

ENV CMAKE_PREFIX_PATH=/usr/lib64/cmake/embree-$EMBREE2_VERSION:/usr/lib64/cmake/embree-$EMBREE3_VERSION

# Embree is installed in /usr/lib64 so we have to add it to LD_LIBRARY_PATH
ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/usr/lib64/

CMD ["/bin/bash"]
