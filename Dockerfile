FROM tensorflow/tensorflow:1.13.2-gpu-py3

# To not be asked for confirmation during packages installation/upgrade
RUN export DEBIAN_FRONTEND=noninteractive

# Upgrade packages
RUN apt-get update && apt-get upgrade -y

# Install some utilities
RUN apt-get install -y --no-install-recommends wget gnupg2 git python3-pip python3-setuptools

# Requirements for Open3D
RUN apt-get install -y --no-install-recommends xorg-dev libglu1-mesa-dev 

# To test the GUI share
RUN apt-get install -y --no-install-recommends firefox
# To share the GUI
RUN touch /root/.Xauthority

RUN ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh


# Clone Open3D PointNet2++ example repo
RUN git clone https://github.com/intel-isl/Open3D-PointNet2-Semantic3D.git
# Requirements for the git repository
ADD ./requirements.txt /tmp/requirements.txt
# Install Python requirements
RUN python3 -m pip install -r /tmp/requirements.txt
# Install the repository requirements
RUN python3 -m pip install -r ./Open3D-PointNet2-Semantic3D/requirements.txt

# Compile TF ops
RUN apt-get install -y --no-install-recommends cmake
RUN cd /Open3D-PointNet2-Semantic3D/tf_ops && mkdir build && cd build && cmake -DCMAKE_C_COMPILER=/usr/bin/gcc ..
RUN make

ENTRYPOINT ["/entrypoint.sh"]
