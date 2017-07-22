FROM antergos/archlinux-base-devel

RUN pacman -Syyu gcc cmake make intel-tbb openmpi git glfw-x11 wget

# All builds will be done in home dir
WORKDIR $HOME

# Download and install embree
RUN wget https://github.com/embree/embree/releases/download/v2.16.4/embree-2.16.4.x86_64.linux.tar.gz && tar -xaf embree-2.16.4.x86_64.linux.tar.gz && rm embree-2.16.4.x86_64.linux.tar.gz

# Download and unpack ISPC
RUN wget https://downloads.sourceforge.net/project/ispcmirror/v1.9.1/ispc-v1.9.1-linux.tar.gz && tar -xaf ispc-v1.9.1-linux.tar.gz && rm ispc-v1.9.1-linux.tar.gz

ENV PATH $PATH:$HOME/ispc-v1.9.1-linux
ENV embree_DIR=$HOME/embree-2.16.4.x86_64.linux

CMD ["/bin/bash"]
