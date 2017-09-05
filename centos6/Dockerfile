FROM centos:6

ENV ISPC_VERSION="1.9.1"
ENV EMBREE_VERSION="2.16.5"

RUN mkdir /gitlab
ENV HOME=/gitlab

# All builds will be done in home dir
WORKDIR $HOME

# Install all req packages
RUN yum install -y wget git make cmake.x86_64 gcc gcc-c++ libXcursor.x86_64 libXcursor-devel.x86_64 libXrandr.x86_64 libXrandr-devel.x86_64 libXinerama.x86_64 libXinerama-devel.x86_64 mesa-libGL-devel

# Install new gcc
RUN yum install -y centos-release-scl
RUN yum install -y devtoolset-3-gcc devtoolset-3-binutils devtoolset-3-gcc-c++

RUN echo "source scl_source enable devtoolset-3" >> $HOME/.bashrc
ENV CC=/opt/rh/devtoolset-3/root/usr/bin/gcc
ENV CXX=/opt/rh/devtoolset-3/root/usr/bin/g++

# Download and unpack TBB from official site because distro TBB from centos6 is too old.
ENV TBB_TAR tbb2017_20170604oss_lin.tgz
RUN wget https://github.com/01org/tbb/releases/download/2017_U7/${TBB_TAR} && tar -xaf ${TBB_TAR} && rm ${TBB_TAR}
ENV TBB_ROOT=$HOME/$TBB_BASE

# Download and install embree
RUN wget https://github.com/embree/embree/releases/download/v${EMBREE_VERSION}/embree-${EMBREE_VERSION}.x86_64.rpm.tar.gz && tar -xvf embree-${EMBREE_VERSION}.x86_64.rpm.tar.gz && rpm -iv embree-devel-${EMBREE_VERSION}-1.x86_64.rpm embree-lib-${EMBREE_VERSION}-1.x86_64.rpm --force --nodeps && rm embree-${EMBREE_VERSION}.x86_64.rpm.tar.gz *.rpm

# Download and unpack ISPC
RUN wget https://downloads.sourceforge.net/project/ispcmirror/v${ISPC_VERSION}/ispc-v${ISPC_VERSION}-linux.tar.gz && tar -xvf ispc-v${ISPC_VERSION}-linux.tar.gz && rm ispc-v${ISPC_VERSION}-linux.tar.gz
ENV PATH $PATH:$HOME/ispc-v${ISPC_VERSION}-linux

CMD ["/bin/bash -l"]
