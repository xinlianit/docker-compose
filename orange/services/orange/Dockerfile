# 基础镜像源
FROM syhily/orange

# 维护人信息
LABEL maintainer="jirry <jirenyoucn@gmail.com>"

# 设置时区
ENV TIMEZONE Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TIMEZONE /etc/localtime && echo $TIMEZONE > /etc/timezone