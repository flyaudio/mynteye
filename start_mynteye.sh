#!/bin/bash

sudo docker start mynteye 

#gnome-terminal -x bash -c 'echo $DATE'
gnome-terminal -x bash -c 'docker exec -it -w /matt mynteye bash start_mynteye_docker.sh;exec bash'

x=1
while [ $x -le 15 ]
do
  echo "countdown $x"
  x=$(( $x + 1 ))
  sleep 1
done


sudo docker exec -it -w /matt mynteye bash start_mynteyebag_record_docker.sh

#udo docker exec -it -w /matt mynteye bash start_mynteye_docker.sh



