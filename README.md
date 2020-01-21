# Docker image that creates an environment to run PointNet++ segmentation on Open3D

Project: https://github.com/intel-isl/Open3D-PointNet2-Semantic3D

# Build image

sudo docker image build -t test .

# List running containers

sudo docker ps

# List all containers

sudo docker ps -a

# Stop container

sudo docker stop CONTAINER_NAME

# SIGKILL a container

docker kill CONTAINER_ID

# Remove one or more containers

sudo docker rm CONTAINER_NAME

# List images

sudo docker images

# Remove one or more images

docker rmi IMAGE_NAME

docker pull IMAGE_NAME

docker run ubuntu sleep 5

# run in dettached mode

docker run -d web_app

# Attach to a container

docker attach a043d

docker exec CONTAINER_NAME cat /etc/hosts

- RUN - STDIN \*

# interactive mode and attached to the terminal

docker run -it image_name

- RUN - PORT Mapping \*

docker run -p DOCKER_HOST_PORT:CONTAINER_PORT image_name

- RUN - Volume mapping \*

# Map outside directory to docker directory so the data can be stored locally

docker run -v /opt/datadir:/var/lib/mysql image_name

- Inspect Container \*
  docker inspect CONTAINER_NAME

* Container Logs \*
  docker logs CONTAINER_NAME

* ENV Variables in Docker \*

docker run -e APP_COLOR=blue IMAGE_NAME

# Publish to public Docker Hub registry

docker push mclzc/my-image-test

docker history IMAGE_NAME

- Save a docker image \*
  docker save --output busybox.tar busybox
  docker save myimage:latest | gzip > myimage_latest.tar.gz

- Load an image \*
  docker load --input fedora.tar

sudo docker tag test mclzc/test

docker run --rm -ti -p 5900:5900 mydocker

# Run docker with GUI cappabilities

sudo docker run \
 -it \
 --rm \
 --user $(id -u):$(id -g) \
 --env DISPLAY=$DISPLAY \
 --volume $XAUTHORITY:/root/.Xauthority \
 --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
 test

# Run docker and map a directory

docker run -v /host/directory:/container/directory test

# Remove all stopped containers

sudo docker container prune

# Remove all images without at least one container associated to them.

sudo docker image prune -a

# Run and test official Tensorflow Docker with GPU support

sudo docker run --gpus all -it --rm tensorflow/tensorflow:latest-gpu \
 python -c "import tensorflow as tf; print(tf.reduce_sum(tf.random.normal([1000, 1000])))"

# Run docker with GUI cappabilities and GPU

sudo docker run \
 --gpus all \
 -it \
 --rm \
 --user $(id -u):$(id -g) \
 --env DISPLAY=$DISPLAY \
 --volume $XAUTHORITY:/root/.Xauthority \
 --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
 test
