#!/bin/bash
set -e

# setup ros environment
# >>>>>>>>>>>>>>>>>>>>>>>>>>>#
. /opt/ros/kinetic/setup.bash
#. ~/catkin_ws/devel/setup.bash
. ~/MYNT-EYE-S-SDK/wrappers/ros/devel/setup.bash
. ~/MYNT-EYE-D-SDK/wrappers/ros/devel/setup.bash
export ROS_MASTER_URI=http://localhost:11311
#export ROS_MASTER_URI=http://192.168.1.105:11311
export ROS_HOSTNAME=localhost
#export ROS_HOSTNAME=172.17.0.1

# roslaunch mynt_eye_ros_wrapper mynteye.launch
roslaunch mynteye_wrapper_d mynteye.launch 
# roscore
exec "$@"

