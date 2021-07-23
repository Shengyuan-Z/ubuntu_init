# basic things
apt-get install build-essential -y
apt install -y g++
apt install -y cmake
apt install -y make
apt install -y wget unzip


# python
add-apt-repository ppa:deadsnakes/ppa
apt-get update
apt-get install python3.7

# ffmpeg
apt install ffmpeg -y

# vim
apt install vim -y

# git
apt install git -y

# htop
apt install htop -y

# opencv
wget -O opencv.zip https://github.com/opencv/opencv/archive/master.zip
unzip opencv.zip
mv opencv-master opencv

mkdir -p build && cd build
cmake ../opencv
make -j8

make install

cd ..
rm -r build opencv


# CUDA Toolkit
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/11.2.0/local_installers/cuda-repo-ubuntu2004-11-2-local_11.2.0-460.27.04-1_amd64.deb
dpkg -i cuda-repo-ubuntu2004-11-2-local_11.2.0-460.27.04-1_amd64.deb
apt-key add /var/cuda-repo-ubuntu2004-11-2-local/7fa2af80.pub
apt-get update
apt-get -y install cuda

echo 'export PATH=/usr/local/cuda-11.2/bin${PATH:+:${PATH}}' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/usr/local/cuda-11.2/lib64\' >> ~/.bashrc
echo '              ${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}' >> ~/.bashrc
source ~/.bashrc


