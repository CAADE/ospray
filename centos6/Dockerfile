FROM centos:6

ENV OSPRAY_VER="1.7.2"
ENV EMBREE3_VER="3.3.0"
ENV ISPC_VERSION="1.9.2"

RUN mkdir /gitlab
ENV HOME=/gitlab

WORKDIR $HOME

# Install all req packages
RUN yum install -y wget git make cmake.x86_64 gcc gcc-c++ tbb.x86_64 tbb-devel.x86_64 libXcursor.x86_64 libXcursor-devel.x86_64 libXrandr.x86_64 libXrandr-devel.x86_64 libXinerama.x86_64 libXinerama-devel.x86_64 mesa-libGL-devel

RUN yum install -y ispc libGLU openmpi

# Install packages req for MPI support
RUN yum install -y environment-modules sudo openmpi openmpi-devel

# Download and install embree
RUN wget https://github.com/embree/embree/releases/download/v${EMBREE3_VER}/embree-${EMBREE3_VER}.x86_64.rpm.tar.gz
RUN tar -xvf embree-${EMBREE3_VER}.x86_64.rpm.tar.gz
RUN rpm -iv embree3-devel-${EMBREE3_VER}-1.noarch.rpm embree3-lib-${EMBREE3_VER}-1.x86_64.rpm --force
RUN rm embree-${EMBREE3_VER}.x86_64.rpm.tar.gz *.rpm

# Download and unpack ISPC
RUN wget https://downloads.sourceforge.net/project/ispcmirror/v${ISPC_VERSION}/ispc-v${ISPC_VERSION}-linux.tar.gz
RUN tar -xvf ispc-v${ISPC_VERSION}-linux.tar.gz
RUN rm ispc-v${ISPC_VERSION}-linux.tar.gz
ENV PATH $PATH:$HOME/ispc-v${ISPC_VERSION}-linux

# RUN wget https://github.com/ospray/OSPRay/releases/download/v$OSPRAY_VER/ospray-$OSPRAY_VER.x86_64.rpm.tar.gz
# RUN tar xvzf ospray-$OSPRAY_VER.x86_64.rpm.tar.gz
# RUN rpm -iv *.rpm
# RUN rm ospray-$OSPRAY_VER.x86_64.rpm.tar.gz *.rpm

CMD ["/bin/bash -l"]

