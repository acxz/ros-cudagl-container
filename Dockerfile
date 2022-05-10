ARG ROS_TAG
ARG CUDAGL_TAG

# obtain ros image
FROM docker.io/osrf/ros:${ROS_TAG} AS ros

# base image off of cudagl
FROM docker.io/nvidia/cudagl:${CUDAGL_TAG}

# copy the entire ros image into the cudagl image
COPY --from=ros / /

# add key from nvidia as it gets overwritten by the ros image
RUN apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/3bf863cc.pub
