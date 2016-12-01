FROM alpine
MAINTAINER wangjh <wangjh@bcc.ac.cn>
ENV NODE_ENV production
ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk/jre
ENV PATH $PATH:/usr/lib/jvm/java-1.8-openjdk/jre/bin:/usr/lib/jvm/java-1.8-openjdk/bin

RUN apk add --no-cache openjdk8-jre

RUN apk add --no-cache --virtual .build-deps pcre libgcc libstdc++ libuv \
    && apk add --no-cache nodejs \
    && npm i -g pm2 \
    && apk del .build-deps \
    && npm cache clean  \
    && rm -rf /tmp/*

ADD http://mirrors.jenkins-ci.org/war/latest/jenkins.war /
RUN chmod 644 jenkins.war && ls && java -jar /jenkins.war

CMD ["java", "-jar", "/jenkins.war"]
EXPOSE 8080
