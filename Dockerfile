FROM jenkins:alpine
MAINTAINER wangjh <wangjh@bcc.ac.cn>
ENV NODE_ENV production
RUN apk add --no-cache --virtual .build-deps pcre libgcc libstdc++ libuv \
    && apk add --no-cache nodejs \
    && npm i -g pm2 \
    && apk del .build-deps \
    && npm cache clean  \
    && rm -rf /tmp/*
