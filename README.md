# ros-cudagl-container
A repository for creating OCI containers with ROS and CUDA/OpenGL.

## Pull from Docker Hub

Example:

```bash
podman pull docker.io/acxz/ros-cudagl:melodic-desktop-full-bionic_10.2-devel-ubuntu18.04
```

## Build your own images

### Dependencies

- [podman-compose](https://github.com/containers/podman-compose)

### `.env` file

Make sure to change the `ROS_TAG`, `OPENGL_TAG`, and `CUDA_TAG` with the appropriate image
tags provided by [osrf/ros](https://hub.docker.com/r/osrf/ros/tags),
[nvidia/opengl](https://hub.docker.com/r/nvidia/opengl/tags), and
[nvidia/cuda](https://hub.docker.com/r/nvidia/cuda/tags).

### Create image
```bash
podman-compose build
```

## Quickstart
```bash
podman-compose build && podman-compose run -d --name ros_cudagl_container ros_cudagl
podman exec -it ros_cudagl_container /bin/bash
```

## Push to Docker Hub

Specify the ros and cudagl combination tags to push images to docker hub in the
`hub_push.sh` script and run as follows.

```bash
sh hub_push.sh
```
