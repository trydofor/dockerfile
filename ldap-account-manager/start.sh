#!/bin/bash

if [ ! -e /config/config.cfg ]; then
  /bin/cp -f /var/lib/ldap-account-manager/config/config.cfg.sample /config/config.cfg
  chown www-data:www-data -R /config/config.cfg
  chown www-data:www-data -R /var/lib/ldap-account-manager/config/config.cfg

fi

if [ ! -e /config/sess ]; then
  mkdir /config/mess
  /bin/cp -rf /var/lib/ldap-account-manager/sess.back /config/sess
  chown www-data:www-data -R /config/sess
  chmod www-data:www-data -R /var/lib/ldap-account-manager/sess
fi


rm -f /var/run/apache2/apache2.pid
/usr/sbin/apache2ctl -D FOREGROUND
