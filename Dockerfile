FROM ubuntu:18.04

# Requirements for the git repository
ADD ./requirements.txt ./requirements.txt

# Tensorflow requirements
RUN wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-repo-ubuntu1804_10.1.243-1_amd64.deb
RUN dpkg -i cuda-repo-ubuntu1804_10.1.243-1_amd64.deb
RUN apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub
RUN wget http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64/nvidia-machine-learning-repo-ubuntu1804_1.0.0-1_amd64.deb
RUN apt install ./nvidia-machine-learning-repo-ubuntu1804_1.0.0-1_amd64.deb
RUN apt-get update && \
    apt-get install -y cuda-10-1 libcudnn7 libcudnn7-dev

# Install TensorRT. Requires that libcudnn7 is installed above.
RUN apt-get install -y libnvinfer6 libnvinfer-dev

# Install tensorflow with gpu support
RUN pip3 install -r requirements.txt

# Requirements for the git repository
RUN apt-get update && \
    apt-get -y install git xorg-dev libglu1-mesa-dev python3-pip

RUN git clone https://github.com/intel-isl/Open3D-PointNet2-Semantic3D.git

WORKDIR Open3D-PointNet2-Semantic3D

RUN pip3 install -r requirements.txt

ENV name Manuel Zanutelli
ENTRYPOINT echo "Hello, $name"
