# Basic components

## 1. Replacing apt resources with Tsinghua's
```sudo bash apt-sources.sh```

## 2. Installing basic things (Maybe 30-min long. XD)
```sudo bash apt-install.sh```

## 3. Installing nvidia driver
```sudo bash nvidia_driver.sh```


**Rebooting** is needed after this step. 

Afterwards, you can use `nvidia-smi` to display your driver informations.
## 4. Installing cuda and cudnn
You should download `cudnn-local-repo-ubuntu2004-8.4.0.27_1.0-1_amd64.deb` on [nvidia-cudnn](https://developer.nvidia.com/rdp/cudnn-download) and put it in this git directory first. Login may be needed. 

Then

```sudo bash cuda_cudnn.sh```

You will see `Result = PASS` and `Test passed!` respectively for the sucesses of `cuda` and `cudnn`.


BTW, the details is recorded on [my article](https://segmentfault.com/a/1190000041788291).

## 5. Installing docker and nvidia-docker
sudo bash docker_install.sh

## 6. (optional) Installing softwares
sudo bash software.sh


# Adding docker container for others

```bash
sudo bash docker_deployment.sh
```

Then, you need to input the name of the container, at least one GPU, size and port attached to it.

E.g.

```bash
user@machine:~$ sudo bash docker_deployment.sh
host name: t5
gpu option: (0, 1, 2) 0,1
size(unit:GB) : 64
port: 10005
```

 
