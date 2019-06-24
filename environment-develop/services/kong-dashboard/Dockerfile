FROM pgbi/kong-dashboard
LABEL maintainer="jirry <jirenyoucn@gmail.com>"

# 设置时区
ENV TIMEZONE=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TIMEZONE /etc/localtime && echo $TIMEZONE > /etc/timezone