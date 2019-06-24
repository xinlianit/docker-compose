FROM postgres:9.6
LABEL maintainer="jirry <jirenyoucn@gmail.com>"

# 设置时区
ENV TIMEZONE=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TIMEZONE /etc/localtime && echo $TIMEZONE > /etc/timezone

# 设置安装源镜像
ENV MIRROR_SOURCE=aliyun
COPY ./mirrors/$MIRROR_SOURCE/debian/stretch.list /etc/apt/sources.list