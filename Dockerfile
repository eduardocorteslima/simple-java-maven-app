FROM openjdk:8-jre
VOLUME /tmp
ENV JAVA_OPTS=""
ENTRYPOINT exec java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /$APP
