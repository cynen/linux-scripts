#! /bin/bash

# 一键在CentOS系统上安装 Docker服务的脚本
# 系统要求: CentOS 7 以上.

# 判断入参,入参不正确给出提示.
if [ ! -n "$1" ]; then
	echo "入参为   start  或者  always";
	exit 1; 
fi;

# 定义准备安装的docker的版本,脚本后面会使用到.
DockerVersion=docker-ce-18.06.3.ce-3.el7

# Step1 : remove old version docker
echo "Step1 : remove old version docker";
yum -y remove docker docker-common container-selinux docker-selinux docker-engine;

#Step2: install depends soft
echo "Step2: install depends ";
yum install -y yum-utils device-mapper-persistent-data lvm2;

# Step3 : config manager
echo "Step3: config manager";
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo;


echo "Step4: skip choice the docker version";

echo "Step5: install Docker the version is: "  ${DockerVersion}
yum install -y ${DockerVersion}

# 验证当前安装的脚本:
echo "Step6: verify Docker version "
docker -v

# 根据用户传入的参数.决定是直接启动docker服务或者,将服务加入到开机启动列表中.

if [ $1 = 'start' ] ; then
	echo "Start Docker Service .. "
	systemctl start docker;
elif [ $1 = 'always' ]; then 
	echo "Start Docker restart always ... "
	systemctl start docker;
	systemctl enable docker;
fi


