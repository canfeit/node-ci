FROM alpine:edge
MAINTAINER wangjh <jianhui.wang@hpe.com>
ADD http://mirrors.jenkins-ci.org/war/latest/jenkins.war /
RUN apk add --no-cache tzdata nodejs-current nodejs-current-npm git ttf-dejavu openjdk8-jre \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && node -v && npm -v && npm set strict-ssl false
CMD ["java", "-jar", "/jenkins.war"]
