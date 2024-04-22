# Intro

This is a branch for any new installed ubuntu 22.04, contains one-key scripts basic tools and configurations.

# apt 换源
```bash
sudo sh apt_mirror_change.sh
```

Terminal should say:
```bash
Successfully updated package lists
```

References
- [Tsinghua mirror](https://mirrors.tuna.tsinghua.edu.cn/help/ubuntu/)

# Nvidia driver and cuda toolkit
```bash
# Nvidia driver
sudo nvidia_driver_install.sh

# Nvidia cuda toolkit 12.4
sudo sh nvidia_cuda_install.sh
```

References:
- [nvidia driver](https://www.nvidia.com/Download/index.aspx?lang=en-us)
- [ubuntu nvidia driver install](https://ubuntu.com/server/docs/nvidia-drivers-installation)
- [container-toolkit](https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&Distribution=Ubuntu&target_version=22.04&target_type=deb_network)

# Basic tools
```bash
sudo sh basic_tools_install.sh
```

# Shell: Oh My Zsh
```bash
# ATTENTION! `sudo` is OMITTED!!
sh ezsh.sh 
# Finally sudo password is needed

# Restart to take effect
sudo reboot
```

# conda: miniconda
```bash
sudo sh miniconda_install.sh
```

# Docker service
```bash
sudo sh docker_install.sh
```

Terminal should say:

```bash
...
Hello from Docker!
This message shows that your installation appears to be working correctly.
...
```

References:
- [Docker install](https://docs.docker.com/engine/install/ubuntu/)

# [Optional] Docker mirror change for Chinese mainland
```
sudo sh docker_mirror_change.sh
```

Terminal should say like:
```bash
1.88.1
e170252f762678dec6ca2cc69aba1570769a5d39
x64
```

References:
- [docker更换镜像源](https://www.jianshu.com/p/b4a6239712bf)

# Docker GPU Support
```bash
sudo sh docker_gpu_support.sh
```

Terminal should say:
what `nvidia-smi` shows info of GPU


References:
- [Runtime options with Memory, CPUs, and GPUs](https://docs.docker.com/config/containers/resource_constraints/#access-an-nvidia-gpu)
- [Installing the NVIDIA Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html)

# BEST universal code editor: VSCode
```
sudo sh vscode_install.sh
```

Terminal should say like:
```
1.88.1
e170252f762678dec6ca2cc69aba1570769a5d39
x64
```

References:
- [VSCode setup](https://code.visualstudio.com/docs/setup/linux)


# [Optional] Other tools

```bash
sudo sh other_tools_install.sh
```
