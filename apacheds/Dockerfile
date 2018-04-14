################
# http://directory.apache.org/apacheds/downloads.html
# docker build -t trydofor/apacheds:2.0.0-M24 .
################

FROM java:8-jre-alpine

LABEL maintainer="trydofor"

ENV ADS_VERSION=2.0.0-M24
ENV ADS_HOME=/app/
ARG MIRR=http://mirrors.hust.edu.cn/apache/directory/apacheds/dist/

RUN mkdir -p $ADS_HOME
WORKDIR $ADS_HOME

# bash
RUN apk add --no-cache --update bash tar \
 && rm -rf /var/cache/apk/*

# apacheds
RUN wget $MIRR/${ADS_VERSION}/apacheds-${ADS_VERSION}.tar.gz -O apacheds.tar.gz
#COPY ./apacheds-${ADS_VERSION}.tar.gz ./apacheds.tar.gz

RUN tar -xzf apacheds.tar.gz --strip-components=1 \
    && rm -rf apacheds.tar.gz

ADD ./start.sh .

RUN chmod +x start.sh bin/*.sh && mv instances/default instances.default

VOLUME $ADS_HOME/data

EXPOSE 10389
#EXPOSE 10636
#EXPOSE 60088
#EXPOSE 60464

CMD ["./start.sh"]
