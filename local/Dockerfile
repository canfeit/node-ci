FROM alpine:edge
MAINTAINER wangjh <wangjh@bcc.ac.cn>
ADD jenkins.war /
RUN echo "https://mirror.tuna.tsinghua.edu.cn/alpine/edge/main" > /etc/apk/repositories \
    && echo "https://mirror.tuna.tsinghua.edu.cn/alpine/edge/community" >> /etc/apk/repositories \
    && apk add --no-cache nodejs-current git ttf-dejavu openjdk8-jre \
    && npm set strict-ssl false
CMD ["java", "-jar", "/jenkins.war"]
