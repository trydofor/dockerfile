#!/bin/bash
cd $ADS_HOME
THE_INSTANCE=instances/default

# reset
rm -rf $THE_INSTANCE
cp -rf instances.default $THE_INSTANCE
rm -rf $THE_INSTANCE/conf $THE_INSTANCE/partitions

# conf
if [ ! -d data/conf ]; then
  cp -rf instances.default/conf data/conf
fi
ln -sf $ADS_HOME/data/conf $THE_INSTANCE/conf

# data
if [ ! -d data/partitions ]; then
  cp -rf instances.default/partitions data/partitions
fi
ln -sf $ADS_HOME/data/partitions $THE_INSTANCE/partitions

# logs
ln -sf /dev/stdout "$THE_INSTANCE/log/apacheds.out"
ln -sf /dev/stdout "$THE_INSTANCE/log/apacheds.log"

# start
bin/apacheds.sh start

tail -f /dev/null