FROM alpine:edge
MAINTAINER wangjh <jianhui.wang@hpe.com>
RUN apk add --no-cache nodejs-current \
    && node -v && npm -v && npm set strict-ssl false
