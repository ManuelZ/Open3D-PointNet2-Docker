##### Docker image that creates an environment to run PointNet++ segmentation on Open3D

Project: https://github.com/intel-isl/Open3D-PointNet2-Semantic3D

##### Build image

    sudo docker image build -t open3d-pointnet2 .

##### Create a new container with GUI cappabilities and GPU and mapping of a directory based on an existent image

```
sudo docker create \
 --gpus all \
 -it \
 --env DISPLAY=$DISPLAY \
 --volume $XAUTHORITY:/root/.Xauthority \
 --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
 --volume="/media/manuel/TOSHIBA EXT/Open3D-PointNet2-Semantic3D/dataset/semantic_raw:/Open3D-PointNet2-Semantic3D/dataset/semantic_raw" \
 --name open3d-pointnet2-container \
 open3d-pointnet2
```

##### Start an already created container

    sudo docker container start -i CONTAINER_ID

##### Run docker with GUI cappabilities

```
sudo docker run \
 -it \
 --rm \
 --user $(id -u):$(id -g) \
 --env DISPLAY=$DISPLAY \
 --volume $XAUTHORITY:/root/.Xauthority \
 --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
 --name open3d-pointnet2-container \
 open3d-pointnet2
```

## Common container commands

##### List running containers

    sudo docker ps

##### List all containers

    sudo docker ps -a

##### Stop a container

    sudo docker stop CONTAINER_NAME

##### SIGKILL a container

    sudo docker kill CONTAINER_ID

##### Remove one or more containers

    sudo docker rm CONTAINER_NAME

## Common images commands

##### List images

    sudo docker images

##### Remove one or more images

    docker rmi IMAGE_NAME

## Commands options - RUN

##### Run in dettached mode

    docker run -d web_app

##### Interactive mode and attached to the terminal

    docker run -it IMAGE_NAME

##### Port Mapping

    docker run -p DOCKER_HOST_PORT:CONTAINER_PORT IMAGE_NAME

##### Volume mapping

    docker run -v /host/dir:/container/dir IMAGE_NAME

##### ENV Variables

    docker run -e APP_COLOR=blue IMAGE_NAME

## Other commands

##### Attach to a container

    docker attach a043d

    docker exec CONTAINER_NAME cat /etc/hosts

##### Inspect Container

    sudo docker inspect CONTAINER_NAME

##### Container Logs

    sudo docker logs CONTAINER_NAME

##### Publish to public Docker Hub registry

    sudo docker push mclzc/my-image-test

    docker history IMAGE_NAME

##### Save a docker image

    docker save --output busybox.tar busybox
    docker save myimage:latest | gzip > myimage_latest.tar.gz

##### Load an image

    sudo docker load --input fedora.tar

    sudo docker tag test mclzc/test

    sudo docker run --rm -ti -p 5900:5900 mydocker

##### Remove all stopped containers

    sudo docker container prune

##### Remove all images without at least one container associated to them

    sudo docker image prune -a

##### Run and test official Tensorflow Docker with GPU support

    sudo docker run --gpus all -it --rm tensorflow/tensorflow:latest-gpu \
    python -c "import tensorflow as tf; print(tf.reduce_sum(tf.random.normal([1000, 1000])))"

##### Pull image from Dockerhub

    docker pull IMAGE_NAME

docker run ubuntu sleep 5
