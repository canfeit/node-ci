FROM alpine
MAINTAINER wangjh <wangjh@bcc.ac.cn>
#ENV NODE_ENV production
#ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk/jre
#ENV PATH $PATH:$JAVA_HOME/bin
ADD http://mirrors.jenkins-ci.org/war/latest/jenkins.war /

RUN apk add --no-cache --virtual .build-deps \
 ca-certificates \
 libssh2 \
 libcurl \
 expat \
 pcre \
 git \
 libgcc \
 libstdc++ \
 libuv \
 libffi \
 libtasn1 \
 p11-kit \
 p11-kit-trust \
 java-cacerts \
 libxau \
 libxdmcp \
 libxcb \
 libx11 \
 libxext \
 libxi \
 libxrender \
 libxtst \
 libpng \
 freetype \
 giflib \
 alsa-lib \
 fontconfig \
 encodings \
 libfontenc \
 mkfontscale \
 mkfontdir \
 ttf-dejavu \
    && apk add --no-cache java-common \
    #&& npm i -g pm2 \
    && apk del .build-deps \
    #&& npm cache clean  \
    && ls /tmp -a \
    && rm -rf /tmp/* \
    && java -version

CMD ["java", "-jar", "/jenkins.war"]
