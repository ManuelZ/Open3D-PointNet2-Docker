FROM ubuntu:18.04

ADD ./requirements.txt ./requirements.txt

RUN \
  apt-get update && \
  apt-get -y install git xorg-dev libglu1-mesa-dev python3-pip

RUN ls -a

RUN pip3 install -r requirements.txt

RUN git clone https://github.com/intel-isl/Open3D-PointNet2-Semantic3D.git

WORKDIR Open3D-PointNet2-Semantic3D

ENV name Manuel Zanutelli
ENTRYPOINT echo "Hello, $name"
