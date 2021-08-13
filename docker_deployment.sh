# This differs among different installations of docker and nvidia-docker
# Maybe it doesn't work on your machine
read -p "host name: " hostname
read -p "gpu option: (0, 1, 2) " gpu 
read -p "size(unit:GB) : " size
read -p "port: " port


echo "sudo docker run --name ${hostname} --runtime=nvidia -e NVIDIA_VISIBLE_DEVICES=${gpu} \
-e NVIDIA_DRIVER_CAPABILITIES=compute,graphics,utility,video --network=host --shm-size=${size}G \
-v /mnt:/data -h ${hostname} -d wuminye/deepzsh:cudagl /usr/sbin/sshd -p ${port} -D "

sudo docker run --name ${hostname} --runtime=nvidia -e NVIDIA_VISIBLE_DEVICES=${gpu} \
-e NVIDIA_DRIVER_CAPABILITIES=compute,graphics,utility,video --network=host --shm-size=${size}G \
-v /mnt:/data -h ${hostname} -d wuminye/deepzsh:cudagl /usr/sbin/sshd -p ${port} -D \




# sudo docker run --name ${hostname} --gpus ${gpu}  -e NVIDIA_DRIVER_CAPABILITIES=compute,graphics,utility,video \
#  --network=host --shm-size=${size}G -v /mnt/${hostname}:/data -h ${hostname} -d wuminye/deepzsh:cudagl \
#  /usr/sbin/sshd -p ${port} –D

# sudo nvidia-docker run  --name liukh -e NVIDIA_DRIVER_CAPABILITIES=compute,graphics,utility,video --network=host --shm-size=74G  
# -v /mnt/DataDisk/new_disk/liukh:/data -h liukh -d wuminye/deepzsh:cudagl /usr/sbin/sshd -p 44121 –D

#sudo docker run --gpus all --name ccd_new -e NVIDIA_DRIVER_CAPABILITIES=compute,graphics,utility,video --network=host 
#--shm-size=74G -v /mnt:/data -h yklab -d wuminye/deepzsh:cudagl /usr/sbin/sshd -p 10280 -D