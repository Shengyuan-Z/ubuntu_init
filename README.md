# 1. Basic components

```bash

# 1. Replacing apt resources with Tsinghua's
sudo bash apt-sources.sh

# 2. Installing basic things (Maybe 30-min long. XD)
sudo bash apt-install.sh

# 3 . Installing docker and nvidia-docker
sudo bash docker_install.sh

# 4. (optional) Installing softwares
sudo bash software.sh

```

# 2. Adding docker container for others

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

 
