nvidia-smi

# cuda 11.6
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin

sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600

wget https://developer.download.nvidia.com/compute/cuda/11.6.2/local_installers/cuda-repo-ubuntu2004-11-6-local_11.6.2-510.47.03-1_amd64.deb

dpkg -i cuda-repo-ubuntu2004-11-6-local_11.6.2-510.47.03-1_amd64.deb

apt-key add /var/cuda-repo-ubuntu2004-11-6-local/7fa2af80.pub

apt-get update

apt-get -y install cuda

echo 'export PATH=/usr/local/cuda-11.6/bin${PATH:+:${PATH}}' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/usr/local/cuda-11.6/lib64\' >> ~/.bashrc
echo '              ${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}' >> ~/.bashrc

source ~/.bashrc

rm cuda-repo-ubuntu2004-11-6-local_11.6.2-510.47.03-1_amd64.deb



# cudnn 8
dpkg -i cudnn-local-repo-ubuntu2004-8.4.0.27_1.0-1_amd64.deb

apt-key add /var/cudnn-local-repo-*/7fa2af80.pub

apt-get update

apt-get install libcudnn8=8.4.0.27-1+cuda11.6
apt-get install libcudnn8-dev=8.4.0.27-1+cuda11.6
apt-get install libcudnn8-samples=8.4.0.27-1+cuda11.6


# to verify cuda
git clone --depth=1 https://github.com/NVIDIA/cuda-samples.git
cd cuda-samples/Samples/1_Utilities/deviceQuery
sudo make

cd ../../../..

# to verify cudnn
cp -r /usr/src/cudnn_samples_v8/ ./
cd ./cudnn_samples_v8/mnistCUDNN
make clean && make
cd ../../


cd ./cuda-samples/Samples/1_Utilities/deviceQuery/
./deviceQuery 
cd ../../../..
cd ./cudnn_samples_v8/mnistCUDNN/
./mnistCUDNN
cd ../..

rm -r cudnn_samples_v8
rm -r cuda-samples

