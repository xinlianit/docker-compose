FROM quay.io/fluentd_elasticsearch/fluentd:v3.2.0
LABEL maintainer="jerry <jirenyoucn@gmail.com>"

# 设置服务根目录
ENV SERVICE_PATH ./services/fluentd

# 设置时区
ENV TIMEZONE=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TIMEZONE /etc/localtime && echo $TIMEZONE > /etc/timezone

# 设置安装源镜像
#ENV MIRROR_SOURCE=tencent
# 更新安装源镜像
#COPY ./mirrors/$MIRROR_SOURCE/debian/stretch.list /etc/apt/sources.list