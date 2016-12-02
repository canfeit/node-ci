FROM alpine
MAINTAINER wangjh <wangjh@bcc.ac.cn>
ADD jenkins.war /
RUN echo "https://mirror.tuna.tsinghua.edu.cn/alpine/latest-stable/main" > /etc/apk/repositories \
    && apk add --no-cache nodejs git ttf-dejavu openjdk8-jre
CMD ["java", "-jar", "/jenkins.war"]
