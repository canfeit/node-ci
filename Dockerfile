FROM alpine
MAINTAINER wangjh <wangjh@bcc.ac.cn>
#ENV NODE_ENV production
#ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk/jre
#ENV PATH $PATH:$JAVA_HOME/bin
ADD http://mirrors.jenkins-ci.org/war/latest/jenkins.war /

RUN apk add --no-cache openjdk8-jre nodejs git\
    #&& npm i -g pm2 \
    #&& npm cache clean  \
    && ls /tmp -a \
    && rm -rf /tmp/* \
    && java -version

CMD ["java", "-jar", "/jenkins.war"]
