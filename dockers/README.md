# dockers
Docker相关的一些脚本，方便后期直接使用

即可以趁机学习shell,又可以制作一些常用的脚本工具. 


## install-docker 
一键安装Docker的脚本。

### 使用方法： 
  1. wget https://raw.githubusercontent.com/cynen/dockers/master/install_docker/docker-install-centos7.sh
  
  2. 下载完成后:  chmod +x docker-install-centos7.sh  【给执行权限】
  
  3. 直接执行: ./docker-install-centos7.sh [optins]
  
  [options]   
  - start : 安装完docker之后,直接启动docker服务.
  
  - always: 安装完docker之后,保持docker服务自动重启. [systemctl enable docker]  


# docker-compose [针对多个容器互相依赖的情况]

  注意:Docker-compose需要提前安装docker-compose.

  其次: docker-compose中定义的多个容器,只能运行在一台物理机上,不允许跨机器的调度. 

  特别是 -links 标签: 
    -  其本质就是在容器内部的 /etc/hosts文件中,添加了links容器的hostname 和容器ip的映射而已.
    -  但是在一台机器上,为了部署某个应用,而需要依赖多个容器的时候,较方便.

