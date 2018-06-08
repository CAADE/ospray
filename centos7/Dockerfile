FROM centos:7

ENV ISPC_VERSION="1.9.2"
ENV EMBREE2_VERSION="2.17.4"
ENV EMBREE3_VERSION="3.2.0"

RUN mkdir /gitlab
ENV HOME=/gitlab

# All builds will be done in home dir
WORKDIR $HOME

# Install all req packages
RUN yum install -y wget git make cmake.x86_64 gcc gcc-c++ tbb.x86_64 tbb-devel.x86_64 libXcursor.x86_64 libXcursor-devel.x86_64 libXrandr.x86_64 libXrandr-devel.x86_64 libXinerama.x86_64 libXinerama-devel.x86_64 mesa-libGL-devel

# Install packages req for MPI support
RUN yum install -y environment-modules sudo openmpi openmpi-devel

# Download and install embree
RUN wget https://github.com/embree/embree/releases/download/v${EMBREE2_VERSION}/embree-${EMBREE2_VERSION}.x86_64.rpm.tar.gz && tar -xvf embree-${EMBREE2_VERSION}.x86_64.rpm.tar.gz && rpm -iv embree-devel-${EMBREE2_VERSION}-1.noarch.rpm embree-lib-${EMBREE2_VERSION}-1.x86_64.rpm --force && rm embree-${EMBREE2_VERSION}.x86_64.rpm.tar.gz *.rpm
RUN wget https://github.com/embree/embree/releases/download/v${EMBREE3_VERSION}/embree-${EMBREE3_VERSION}.x86_64.rpm.tar.gz && tar -xvf embree-${EMBREE3_VERSION}.x86_64.rpm.tar.gz && rpm -iv embree3-devel-${EMBREE3_VERSION}-1.noarch.rpm embree3-lib-${EMBREE3_VERSION}-1.x86_64.rpm --force && rm embree-${EMBREE3_VERSION}.x86_64.rpm.tar.gz *.rpm

# Download and unpack ISPC
RUN wget https://downloads.sourceforge.net/project/ispcmirror/v${ISPC_VERSION}/ispc-v${ISPC_VERSION}-linux.tar.gz && tar -xvf ispc-v${ISPC_VERSION}-linux.tar.gz && rm ispc-v${ISPC_VERSION}-linux.tar.gz
ENV PATH $PATH:$HOME/ispc-v${ISPC_VERSION}-linux

# Added user for running MPI jobs
RUN useradd -ms /bin/bash gitlab && echo "gitlab ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

CMD ["/bin/bash -l"]
