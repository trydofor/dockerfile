#!/bin/sh
set -e
# https://www.jetbrains.com/help/youtrack/standalone/Install-YouTrack-JAR-Installation.html
# https://www.jetbrains.com/help/youtrack/standalone/YouTrack-Java-Start-Parameters.html

#YOUTRACK_HOME=/home/trydofor/Workspace/docker/10.Dockerfile/youtrack
#HTTP_PORT=18080

ytk_base=$YOUTRACK_HOME/data/base
ytk_data=$YOUTRACK_HOME/data/data
ytk_backup=$YOUTRACK_HOME/data/backup

[ -e "$ytk_base" ] || mkdir -p $ytk_base
[ -e "$ytk_data" ] || mkdir -p $ytk_data
[ -e "$ytk_backup" ] || mkdir -p $ytk_backup

java ${JVM_ARGS} \
  -Djavax.net.ssl.trustStore=/etc/ssl/certs/java/cacerts \
  -Djavax.net.ssl.trustStorePassword=changeit \
  -Dtrust_all_cert=true \
  -Djava.security.egd=/dev/urandom \
  -Djava.awt.headless=true \
  -Duser.home=$ytk_base \
  -Ddatabase.location=$ytk_base \
  -Ddatabase.backup.location=$ytk_backup \
  -Djetbrains.youtrack.disableBrowser=true \
  -Djetbrains.youtrack.enableGuest=false \
  -Djetbrains.youtrack.disableCheckForUpdate=true \
-jar $YOUTRACK_HOME/youtrack.jar $HTTP_PORT
