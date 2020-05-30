#!/bin/bash

#
sudo docker exec -it -w /matt mynteye bash -c 'source /opt/ros/kinetic/setup.bash;rosnode kill /my_bag'
sudo docker container stop mynteye



