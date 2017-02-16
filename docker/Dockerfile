FROM centos:centos7

RUN yum -y install epel-release && yum -y update\
  && yum -y install zlib-devel gcc gcc-c++ autogen libtool make autoconf\
  automake freetype-devel SDL-devel python-devel python-pip potrace-devel\
  agg-devel unzip python-virtualenv gdal-libs gdal-devel git &&\
  useradd -u 100000 -d /jenkins jenkins-slave &&\
  mkdir /jenkins/{build,out} &&\
  chown -R jenkins-slave:jenkins-slave /jenkins

ADD docker-build-venv.sh /jenkins/build.sh

USER jenkins-slave

CMD ["/bin/bash", "/jenkins/build.sh"]

