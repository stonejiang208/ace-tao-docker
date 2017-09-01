FROM ubuntu:latest
MAINTAINER stonejiang <jiangtao@tao-studio.net>
ADD sources.list /etc/apt/sources.list
RUN apt-get update -y  && apt-get install -y \
    build-essential \
    wget \
    curl \
    libssl-dev \
    git 
ADD ACE+TAO-src-6.4.4.tar.bz2 /opt/dre/
ENV LANG C.UTF-8

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai  /etc/localtime

ENV ACE_ROOT /opt/dre/ACE_wrappers
ENV TAO_ROOT ${ACE_ROOT}/TAO
ENV PATH ${PATH}:${ACE_ROOT}/bin
ENV LD_LIBRARY_PATH ${LD_LIBTRARY_PATH}:${ACE_ROOT}/lib

ADD config.h ${ACE_ROOT}/ace/
ADD platform_macros.GNU ${ACE_ROOT}/include/makeinclude/

RUN cd ${TAO_ROOT} \
  && mwc.pl -type gnuace TAO_ACE.mwc \
  && make -j 4






