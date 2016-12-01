FROM alpine
MAINTAINER wangjh <wangjh@bcc.ac.cn>
ENV NODE_ENV production
ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk/jre
ENV PATH $PATH:$JAVA_HOME/bin
ADD http://mirrors.jenkins-ci.org/war/latest/jenkins.war /

RUN apk add --no-cache --virtual .build-deps pcre libgcc libstdc++ libuv \
    && apk add --no-cache nodejs openjdk8-jre \
    && npm i -g pm2 \
    && apk del .build-deps \
    && npm cache clean  \
    && rm -rf /tmp/* \
    && chmod 644 jenkins.war

CMD ["java", "-jar", "/jenkins.war"]
