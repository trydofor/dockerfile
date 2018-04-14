################
# https://download.jetbrains.com/charisma/youtrack-2018.1.40341.jar
# docker build -t trydofor/youtrack:2018.1.40341 .
################

FROM java:openjdk-8-alpine as builder

# without HTTPS
ARG YOUTRACK_VERSION=2018.1.40341
ARG DOWNLOAD=http://download.jetbrains.com/charisma/

ADD ./start.sh .
ADD ./rejar-license.sh .
ADD ./ring-license-checker-1.0.41.jar .
ADD ./youtrack-${YOUTRACK_VERSION}.jar youtrack.jar
#RUN wget ${DOWNLOAD}/youtrack-${YOUTRACK_VERSION}.jar -O youtrack.jar

RUN chmod +x *.sh
RUN ./rejar-license.sh

#####
FROM java:8-jre-alpine

LABEL maintainer="trydofor"

ENV YOUTRACK_HOME=/app
ENV JVM_ARGS="-Xmx1G"
ENV HTTP_PORT=8384

RUN mkdir -p $YOUTRACK_HOME

WORKDIR $YOUTRACK_HOME

COPY --from=builder /youtrack.jar .
COPY --from=builder /start.sh .

VOLUME $YOUTRACK_HOME/data
EXPOSE $HTTP_PORT

CMD ["./start.sh"]
