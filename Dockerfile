ARG ROS_TAG
ARG OPENGL_TAG
ARG CUDA_TAG

# obtain ros image
FROM docker.io/osrf/ros:${ROS_TAG} AS ros

# obtain opengl image
FROM docker.io/nvidia/opengl:${OPENGL_TAG} AS opengl

# base image off of cuda
FROM docker.io/nvidia/cuda:${CUDA_TAG}

# copy the entire opengl image into the cuda image
COPY --from=opengl / /

# copy the entire ros image into the cuda image
COPY --from=ros / /

# add key from nvidia as it gets overwritten by the ros image
RUN apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub
