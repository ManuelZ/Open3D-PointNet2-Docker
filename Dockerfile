FROM ubuntu:18.04

RUN \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get -y install git xorg-dev libglu1-mesa-dev

RUN git clone https://github.com/intel-isl/Open3D-PointNet2-Semantic3D.git

RUN pip install tensorflow-gpu==1.13.2

WORKDIR Open3D-PointNet2-Semantic3D

ENV name Manuel Zanutelli
ENTRYPOINT echo "Hello, $name"
