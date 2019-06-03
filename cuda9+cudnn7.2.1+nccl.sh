# install CUDA
sudo apt-get update && sudo apt-get install wget -y --no-install-recommends
CUDA_URL="https://developer.nvidia.com/compute/cuda/10.1/Prod/local_installers/cuda-repo-ubuntu1804-10-1-local-10.1.105-418.39_1.0-1_amd64.deb"
wget -c ${CUDA_URL} -O cuda.deb
sudo dpkg --install cuda.deb
sudo apt-key add /var/cuda-repo-10-1/7fa2af80.pub
sudo apt-get update
sudo apt-get install -y cuda
rm cuda.deb

# CUDA_PATCH_URL="https://developer.nvidia.com/compute/cuda/9.2/Prod2/patches/1/cuda-repo-ubuntu1604-9-2-148-local-patch-1_1.0-1_amd64"
# wget -c ${CUDA_PATCH_URL} -O cuda_patch.deb
# sudo dpkg --install cuda_patch.deb
# sudo apt-get upgrade -y cuda
# rm cuda_patch.deb

# install cuDNN 7.2.1
CUDNN_URL="http://developer.download.nvidia.com/compute/redist/cudnn/v7.2.1/cudnn-9.2-linux-x64-v7.2.1.38.tgz"
wget -c ${CUDNN_URL} -O cudnn.tgz
sudo tar -xzf cudnn.tgz -C /usr/local
rm cudnn.tgz
sudo ldconfig

# install nccl
wget http://file.lzhu.me/cuda/nccl-repo-ubuntu1604-2.3.5-ga-cuda9.0_1-1_amd64.deb
sudo dpkg -i nccl-repo-ubuntu1604-2.3.5-ga-cuda9.0_1-1_amd64.deb
sudo apt-get update
sudo apt-get --assume-yes install libnccl2=2.3.5-2+cuda9.0 libnccl-dev=2.3.5-2+cuda9.0
