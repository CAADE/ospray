FROM antergos/archlinux-base-devel

ENV ISPC_VERSION="1.9.2"
ENV EMBREE3_VERSION="3.2.0"

RUN pacman -Syyu --noconfirm gcc clang cmake make intel-tbb openmpi git glfw-x11 wget
# clean package cache
RUN paccache -rfk0

RUN mkdir /gitlab
ENV HOME=/gitlab

# All builds will be done in home dir
WORKDIR $HOME

# Download and unpack ISPC
RUN wget https://downloads.sourceforge.net/project/ispcmirror/v$ISPC_VERSION/ispc-v$ISPC_VERSION-linux.tar.gz && tar -xaf ispc-v$ISPC_VERSION-linux.tar.gz && rm ispc-v$ISPC_VERSION-linux.tar.gz

ENV PATH $PATH:$HOME/ispc-v${ISPC_VERSION}-linux

# Download and install embree
RUN wget https://github.com/embree/embree/releases/download/v${EMBREE3_VERSION}/embree-${EMBREE3_VERSION}.x86_64.linux.tar.gz && tar -xaf embree-${EMBREE3_VERSION}.x86_64.linux.tar.gz && rm embree-${EMBREE3_VERSION}.x86_64.linux.tar.gz


CMD ["/bin/bash"]
