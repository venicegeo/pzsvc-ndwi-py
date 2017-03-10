FROM centos:centos7

WORKDIR /root

RUN yum -y install epel-release && yum -y update\
  && yum -y install zlib-devel gcc gcc-c++ autogen libtool make autoconf\
  automake freetype-devel SDL-devel python-devel python-pip &&\
  wget http://repo.continuum.io/miniconda/Miniconda3-3.7.0-Linux-x86_64.sh -O ~/miniconda.sh &&\
  bash ~/miniconda.sh -b -p $HOME/miniconda &&\
  export PATH="$HOME/miniconda/bin:$PATH"

ADD docker-build-venv.sh /root/build.sh

RUN mkdir /root/build && mkdir /root/out

CMD ["/bin/bash", "/root/build.sh"]

