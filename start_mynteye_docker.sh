#!/bin/bash

# start mynteye_d launch in docker mynteye 
  
#. ~/MYNT-EYE-D-SDK/wrappers/ros/devel/setup.sh

#roslaunch mynteye_wrapper_d mynteye.launch 

cd ~/MYNT-EYE-D-SDK
source wrappers/ros/devel/setup.bash 
roslaunch mynteye_wrapper_d mynteye.launch 
#cd ~/MYNT-EYE-S-SDK
#source wrappers/ros/devel/setup.bash
#roslaunch mynt_eye_ros_wrapper mynteye.launch 
 



