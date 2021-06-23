FROM fluent/fluentd:latest
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

# 使用root账号使用apk
USER root

# 安装插件
RUN gem install fluent-plugin-elasticsearch

USER fluent