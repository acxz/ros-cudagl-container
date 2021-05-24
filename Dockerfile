ARG ROS_TAG
ARG CUDAGL_TAG

# obtain ros image
FROM osrf/ros:${ROS_TAG} AS ros

# base image off of cudagl
FROM nvidia/cudagl:${CUDAGL_TAG}

# copy the entire ros image into the cudagl image
COPY --from=ros / /

# add key from nvidia as it gets overwritten by the ros image
RUN curl -L https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/7fa2af80.pub | apt-key add -

# Needed for opengl applications like gazebo and rviz
# ENV NVIDIA_VISIBLE_DEVICES \
#     ${NVIDIA_VISIBLE_DEVICES:-all}
# ENV NVIDIA_DRIVER_CAPABILITIES \
#     ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics
