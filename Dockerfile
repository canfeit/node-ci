FROM alpine
MAINTAINER wangjh <wangjh@bcc.ac.cn>
ADD http://mirrors.jenkins-ci.org/war/latest/jenkins.war /
RUN apk add --no-cache ttf-dejavu openjdk8-jre nodejs git
CMD ["java", "-jar", "/jenkins.war"]
