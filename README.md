# ros-cudagl-container
A repository for creating OCI containers with ROS and CUDA/OpenGL.

## Pull from Docker Hub

Example:

```bash
podman pull docker.io/acxz/ros-cudagl:melodic-desktop-full-bionic_11.4.2-devel-ubuntu18.04
```

## Build your own images

### Dependencies

- [podman-compose](https://github.com/containers/podman-compose)
- [containernetworking/plugins](https://github.com/containernetworking/plugins)

### `.env` file

Make sure to change the `ROS_TAG` and `CUDAGL_TAG` with the appropriate image
tags provided by [osrf/ros](https://hub.docker.com/r/osrf/ros/tags) and
[nvidia/cudagl](https://hub.docker.com/r/nvidia/cudagl/tags).

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

Make sure you are logged in via: `podman login docker.io`

```bash
sh hub_push.sh
```
