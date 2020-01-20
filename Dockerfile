FROM ubuntu:18.04

RUN export DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get upgrade -y

RUN apt-get update && \
    apt-get install -y --no-install-recommends  wget gnupg2 git python3-pip  && \
    # Requirements for Open3D
    apt-get install -y --no-install-recommends xorg-dev libglu1-mesa-dev 


# Requirements for the git repository
ADD ./requirements.txt /tmp/requirements.txt

# Tensorflow requirements
RUN wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-repo-ubuntu1804_10.1.243-1_amd64.deb
RUN dpkg -i cuda-repo-ubuntu1804_10.1.243-1_amd64.deb
RUN apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub
RUN wget http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64/nvidia-machine-learning-repo-ubuntu1804_1.0.0-1_amd64.deb
RUN apt install ./nvidia-machine-learning-repo-ubuntu1804_1.0.0-1_amd64.deb

# Install NVIDIA driver
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends nvidia-driver-440

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends cuda-10-1 libcudnn7 libcudnn7-dev

# Install TensorRT. Requires that libcudnn7 is installed above.
RUN apt-get install -y --no-install-recommends libnvinfer6 libnvinfer-dev

RUN apt-get install -y --no-install-recommends python3-setuptools

# Install tensorflow with gpu support
RUN python3 -m pip install -r /tmp/requirements.txt

RUN git clone https://github.com/intel-isl/Open3D-PointNet2-Semantic3D.git

#WORKDIR Open3D-PointNet2-Semantic3D

# Install the repository requirements
RUN python3 -m pip install -r ./Open3D-PointNet2-Semantic3D/requirements.txt

RUN ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime

RUN apt-get install -y --no-install-recommends x11vnc xvfb 

COPY entrypoint.sh /entrypoint.sh

# Change Windows CRLF to Unix LF
RUN awk '{ sub("\r$", ""); print }' /entrypoint.sh > /entrypoint.sh

RUN chmod 777 /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
