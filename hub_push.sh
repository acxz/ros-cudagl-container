# A script to automatically push ros-cudagl images to docker hub

declare -a ros_tags=("melodic-desktop-full-bionic")
declare -a cudagl_tags=("11.4.2-devel-ubuntu18.04")

for ros_tag in "${ros_tags[@]}"; do
for cudagl_tag in "${cudagl_tags[@]}"; do

    touch .env
    echo "ROS_TAG=${ros_tag}" > .env
    echo "CUDAGL_TAG=${cudagl_tag}" >> .env

    docker-compose build

    docker tag ros_cudagl:${ros_tag}_${cudagl_tag} \
        acxz/ros-cudagl:${ros_tag}_${cudagl_tag}

    docker push acxz/ros-cudagl:${ros_tag}_${cudagl_tag}

done
done
