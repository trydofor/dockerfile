# 1.must known
user: uid=admin,ou=system
password: secret
https://directory.apache.org/apacheds/basic-ug/1.4.2-changing-admin-password.html
10389 LDAP
10636 LDAPS
60088 Kerberos
60464 Kerberos Change Password

# 2.start
```
docker run -d \
 --name apacheds \
 --restart=unless-stopped \
 -e JAVA_OPTS="-Xms512m -Xmx2048m -Djava.awt.headless=true" \
 -p 10389:10389 \
 -v /data/docker/apacheds/data:/app/data \
trydofor/apacheds:2.0.0-M24
```


# 3.change password

`head /dev/urandom | md5sum`