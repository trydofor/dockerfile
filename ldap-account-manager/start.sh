#!/bin/bash

if [ ! -e /config/config ]; then
  cp -rf /var/lib/ldap-account-manager/config.back /config/config
fi

if [ ! -e /config/sess ]; then
  cp -rf /var/lib/ldap-account-manager/sess.back /config/sess
fi

rm -rf /var/lib/ldap-account-manager/config
rm -rf /var/lib/ldap-account-manager/sess
rm -rf /var/log/apache2/*
rm -rf /var/run/apache2/apache2.pid

chown www-data:www-data -R /config/

ln -sf /config/config  /var/lib/ldap-account-manager/config
ln -sf /config/sess    /var/lib/ldap-account-manager/sess
ln -sf /dev/stdout     /var/log/apache2/access.log
ln -sf /dev/stderr     /var/log/apache2/error.log

/usr/sbin/apache2ctl -D FOREGROUND
