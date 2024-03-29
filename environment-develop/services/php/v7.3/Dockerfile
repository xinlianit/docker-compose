# 基础镜像源
FROM php:7.3-fpm

# 维护人信息
LABEL maintainer="jirry <jirenyoucn@gmail.com>"

# 设置服务根目录
ENV SERVICE_PATH ./services/php

# 设置时区
ENV TIMEZONE Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TIMEZONE /etc/localtime && echo $TIMEZONE > /etc/timezone

# 设置安装源镜像
ENV MIRROR_SOURCE=aliyun
COPY ./mirrors/$MIRROR_SOURCE/debian/stretch.list /etc/apt/sources.list
COPY ./mirrors/$MIRROR_SOURCE/debian/buster.list /etc/apt/sources.list.d/buster.list

# 安装Composer
COPY $SERVICE_PATH/pkg/composer.phar /usr/local/bin/composer

# 配置Laravel镜像
RUN chmod +x /usr/local/bin/composer \
&& composer config -g repo.packagist composer https://packagist.laravel-china.org

# 更新并安装依赖包和PHP核心扩展
#
# –no-install-recommends 参数来避免安装非必须的文件，从而减小镜像的体积
# libpcre3-dev 是 opcache 必须库
# libpq-dev 是 pdo_pgsql 必须库
RUN apt-get clean all && apt-get update && apt-get install -y \
git \
libfreetype6-dev \
libjpeg62-turbo-dev \
libpng-dev \
libpq-dev \
libpcre3-dev \
libmcrypt-dev \
libzip-dev \
zip \
&& docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
&& docker-php-ext-install -j$(nproc) gd \
&& docker-php-ext-configure zip --with-libzip \
&& docker-php-ext-install zip \
&& docker-php-ext-install pdo_mysql \
&& docker-php-ext-install pdo_pgsql \
&& docker-php-ext-install opcache \
&& docker-php-ext-install mysqli \
&& docker-php-ext-install -j$(nproc) iconv \
&& docker-php-ext-install mbstring \
&& rm -r /var/lib/apt/lists/*

# 安装 Redis 扩展
COPY $SERVICE_PATH/pkg/phpredis-4.3.0.tar.gz /usr/local/src/phpredis-4.3.0.tar.gz
RUN cd /usr/local/src/ \
&& tar -zxvf phpredis-4.3.0.tar.gz \
&& cd phpredis-4.3.0 \
&& phpize \
&& ./configure --with-php-config=/usr/local/bin/php-config \
&& make && make install \
&& echo "extension=redis.so" > /usr/local/etc/php/conf.d/redis.ini \
&& cd ../ && rm -rf phpredis*

# 安装 Swoole 扩展
# see: https://github.com/swoole/swoole-src
# TODO: COPY 应该放在 `if` 判断执行
ARG INSTALL_SWOOLE=false
COPY $SERVICE_PATH/pkg/swoole.tar.gz /usr/local/src/swoole.tar.gz
RUN if [ ${INSTALL_SWOOLE} = true ]; then \
	cd /usr/local/src \
	&& tar -zxvf swoole.tar.gz && cd swoole-src-4.3.0 \
	&& phpize \
	&& ./configure \
	&& make && make install \
	&& echo "extension=swoole.so" > /usr/local/etc/php/conf.d/swoole.ini \
	&& cd ../ && rm -rf swoole* \
;fi

# 配置 php.ini
COPY $SERVICE_PATH/etc/php/php.ini /usr/local/etc/php/php.ini

