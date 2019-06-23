FROM kong:0.13.1-centos
LABEL maintainer="jirry <390066398@qq.com>"

# 设置服务根目录
ENV SERVICE_PATH ./services/kong

# 设置时区
ENV TIMEZONE=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TIMEZONE /etc/localtime && echo $TIMEZONE > /etc/timezone

# 设置安装源镜像
ENV MIRROR_SOURCE=aliyun
COPY ./mirrors/$MIRROR_SOURCE/debian/stretch.list /etc/apt/sources.list

# 复制配置文件
COPY $SERVICE_PATH/etc/kong.conf  /etc/kong/kong.conf