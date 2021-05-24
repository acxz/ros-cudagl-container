# ros-cudagl-container
A repository for creating OCI containers with ROS and CUDA/OpenGL.

## Pull from Docker Hub

Example:

```bash
docker pull acxz/ros-cudagl:melodic-desktop-full-bionic_10.2-devel-ubuntu18.04
```

## Build your own images

### Dependencies

- [docker-compose](https://docs.docker.com/compose/)

### `.env` file

Make sure to change the `ROS_TAG` and `CUDAGL_TAG` with the appropriate image
tags provided by [osrf/ros](https://hub.docker.com/r/osrf/ros/tags) and
[nvidia/cudagl](https://hub.docker.com/r/nvidia/cudagl/tags).

### Create image
```bash
docker-compose build
```

## Quickstart
```bash
docker-compose build && docker-compose run -d --name ros_cudagl_container ros_cudagl
docker exec -it ros_cudagl_container /bin/bash
```
