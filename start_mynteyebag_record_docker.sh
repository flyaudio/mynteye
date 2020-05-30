#!/bin/bash

# first step is start terminl to run mynteye launch ,and then record bag 

#gnome-terminal -t “start-mynteye” -x bash -c “. ./start_mynteye_docker.sh;exec bash;”


#. ~/MYNT-EYE-D-SDK/wrappers/ros/devel/setup.sh
#rosbag record -b 0 /mynteye/left/image_color/compressed /mynteye/right/image_color/compressed /mynteye/imu/data_raw 

source ~/MYNT-EYE-D-SDK/wrappers/ros/devel/setup.bash  
rosbag record -b 0  /mynteye/left/image_color/compressed /mynteye/right/image_color/compressed  /mynteye/imu/data_raw __name:=my_bag

#source ~/MYNT-EYE-S-SDK/wrappers/ros/devel/setup.bash 
#rosbag record -b 0  /mynteye/imu/data_raw 


