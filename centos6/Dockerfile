FROM centos:6

ENV ISPC_VERSION="1.9.2"
ENV EMBREE2_VERSION="2.17.4"
ENV EMBREE3_VERSION="3.2.0"
ENV TBB_BASE="tbb2018_20180411oss"
ENV TBB_FOLDER="2018_U4"

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
ENV TBB_TAR ${TBB_BASE}_lin.tgz
RUN wget https://github.com/01org/tbb/releases/download/${TBB_FOLDER}/${TBB_TAR} && tar -xaf ${TBB_TAR} && rm ${TBB_TAR}
ENV TBB_ROOT=$HOME/$TBB_BASE

# Download and install embree
RUN wget https://github.com/embree/embree/releases/download/v${EMBREE2_VERSION}/embree-${EMBREE2_VERSION}.x86_64.rpm.tar.gz && tar -xvf embree-${EMBREE2_VERSION}.x86_64.rpm.tar.gz && rpm -iv embree-devel-${EMBREE2_VERSION}-1.noarch.rpm embree-lib-${EMBREE2_VERSION}-1.x86_64.rpm --force --nodeps && rm embree-${EMBREE2_VERSION}.x86_64.rpm.tar.gz *.rpm
RUN wget https://github.com/embree/embree/releases/download/v${EMBREE3_VERSION}/embree-${EMBREE3_VERSION}.x86_64.rpm.tar.gz && tar -xvf embree-${EMBREE3_VERSION}.x86_64.rpm.tar.gz && rpm -iv embree3-devel-${EMBREE3_VERSION}-1.noarch.rpm embree3-lib-${EMBREE3_VERSION}-1.x86_64.rpm --force --nodeps && rm embree-${EMBREE3_VERSION}.x86_64.rpm.tar.gz *.rpm

# Download and unpack ISPC
RUN wget https://downloads.sourceforge.net/project/ispcmirror/v${ISPC_VERSION}/ispc-v${ISPC_VERSION}-linux.tar.gz && tar -xvf ispc-v${ISPC_VERSION}-linux.tar.gz && rm ispc-v${ISPC_VERSION}-linux.tar.gz
ENV PATH $PATH:$HOME/ispc-v${ISPC_VERSION}-linux

CMD ["/bin/bash -l"]
