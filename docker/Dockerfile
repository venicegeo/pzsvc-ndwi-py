FROM centos:centos7

WORKDIR /root

RUN yum -y install epel-release && yum -y update\
  && yum -y install zlib-devel gcc gcc-c++ autogen libtool make autoconf\
  automake freetype-devel SDL-devel python-devel python-pip potrace-devel\
  agg-devel unzip python-virtualenv gdal-libs gdal-devel git 

ADD docker-build-venv.sh /root/build.sh

RUN mkdir /root/build && mkdir /root/out

CMD ["/bin/bash", "/root/build.sh"]

