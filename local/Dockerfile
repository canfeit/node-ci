FROM alpine:edge
MAINTAINER wangjh <wangjh@bcc.ac.cn>
ADD jenkins.war /
RUN echo "https://mirror.tuna.tsinghua.edu.cn/alpine/edge/main" > /etc/apk/repositories \
    && echo "https://mirror.tuna.tsinghua.edu.cn/alpine/edge/community" >> /etc/apk/repositories \
    && apk add --no-cache tzdata nodejs-current git ttf-dejavu openjdk8-jre \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && npm set strict-ssl false
CMD ["java", "-jar", "/jenkins.war"]
