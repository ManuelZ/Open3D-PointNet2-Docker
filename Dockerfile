FROM tensorflow/tensorflow:2.1.0-gpu-py3

# To not be asked for confirmation during packages installation/upgrade
RUN export DEBIAN_FRONTEND=noninteractive

# Upgrade packages
RUN apt-get update && apt-get upgrade -y

# Install some utilities
RUN apt-get install -y --no-install-recommends wget gnupg2 git python3-pip python3-setuptools

# Requirements for Open3D
RUN apt-get install -y --no-install-recommends xorg-dev libglu1-mesa-dev 

# Requirements for the git repository
ADD ./requirements.txt /tmp/requirements.txt

# Install Python libraries
RUN python3 -m pip install -r /tmp/requirements.txt
# Clone Open3D PointNet2++ example repo
RUN git clone https://github.com/intel-isl/Open3D-PointNet2-Semantic3D.git
# Install the repository requirements
RUN python3 -m pip install -r ./Open3D-PointNet2-Semantic3D/requirements.txt

RUN ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime

# To test the GUI share
RUN apt-get install -y --no-install-recommends firefox
# To share the GUI
RUN touch /root/.Xauthority

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
