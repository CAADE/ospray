FROM ubuntu:14.04

ENV OSPRAY_VER="1.7.2"
ENV EMBREE3_VER="3.3.0"

RUN apt update
RUN apt -y upgrade
RUN apt -y install pkg-config g++ vim wget clang git netcat-openbsd cmake libtbb-dev imagemagick freeglut3-dev libxmu-dev libxi-dev alien

RUN wget https://github.com/embree/embree/releases/download/v$EMBREE3_VER/embree-$EMBREE3_VER.x86_64.rpm.tar.gz
RUN tar -xvf embree-$EMBREE3_VER.x86_64.rpm.tar.gz
RUN alien --scripts *.rpm
RUN dpkg -i *.deb
RUN rm embree-$EMBREE3_VER.x86_64.rpm.tar.gz *.rpm *.deb

RUN wget https://github.com/ospray/OSPRay/releases/download/v$OSPRAY_VER/ospray-$OSPRAY_VER.x86_64.rpm.tar.gz
RUN tar xvzf ospray-$OSPRAY_VER.x86_64.rpm.tar.gz
RUN alien --scripts *.rpm
RUN dpkg -i *.deb
RUN rm ospray-$OSPRAY_VER.x86_64.rpm.tar.gz *.rpm *.deb

CMD ["/bin/bash"]
