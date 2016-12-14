FROM alpine:edge
MAINTAINER wangjh <wangjh@bcc.ac.cn>
ADD http://mirrors.jenkins-ci.org/war/latest/jenkins.war /
RUN apk add --no-cache tzdata nodejs-current git ttf-dejavu openjdk8-jre \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && npm set strict-ssl false
CMD ["java", "-jar", "/jenkins.war"]
