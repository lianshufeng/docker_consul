

FROM centos:8 as builder
MAINTAINER lianshufeng <251708339@qq.com>



# 安装 consul
RUN yum install -y yum-utils
RUN yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
RUN yum -y install consul


	






