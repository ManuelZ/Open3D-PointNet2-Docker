FROM ubuntu:18.04

RUN \
  apt-get update && \
  apt-get -y install git xorg-dev libglu1-mesa-dev python3-pip

RUN ["python3", "-m", "pip install tensorflow-gpu==1.13.2"]

RUN git clone https://github.com/intel-isl/Open3D-PointNet2-Semantic3D.git

WORKDIR Open3D-PointNet2-Semantic3D

ENV name Manuel Zanutelli
ENTRYPOINT echo "Hello, $name"
