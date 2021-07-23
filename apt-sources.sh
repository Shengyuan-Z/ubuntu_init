release_num=$(lsb_release -r --short)


mv /etc/apt/sources.list /etc/apt/sources.list.bak

if [ $release_num = "20.04" ];then 
	cp sources.list.20 /etc/apt/sources.list
elif [ $release_num = "18.04" ];then
	cp sources.list.18 /etc/apt/sources.list
fi

apt update



