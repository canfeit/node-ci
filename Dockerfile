FROM alpine
MAINTAINER wangjh <wangjh@bcc.ac.cn>
ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk/jre
ENV PATH $PATH:$JAVA_HOME/bin
ADD http://mirrors.jenkins-ci.org/war/latest/jenkins.war /

RUN apk add --no-cache ttf-dejavu openjdk8-jre \
    && rm -rf /tmp/* \
    && chmod 644 jenkins.war

CMD ["java", "-jar", "/jenkins.war"]
