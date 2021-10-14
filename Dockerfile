FROM tomcat:8.5.46-jdk8-openjdk

ARG warpath
ARG UNAME=jenkins
ARG UID=988
ARG GID=981

RUN groupadd -g $GID $UNAME
RUN useradd -m -u $UID -g $GID -s /bin/bash $UNAME
RUN chown -R $UNAME:$UNAME /usr/local/tomcat
USER $UNAME

RUN rm -Rf /usr/local/tomcat/webapps/ROOT ## tomcat root 경로 삭제
COPY $warpath  /usr/local/tomcat/webapps/ROOT.war
