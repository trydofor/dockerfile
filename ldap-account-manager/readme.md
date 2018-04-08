# 1. docker
```
docker run  -d \
 --name 50.lam \
 -p 10080:80 \
 -v /data/docker/lam/conf:/config \
trydofor/ldap-account-manager:6.3
```

# 2.proxy
```
server {
  listen 80;
  server_name ldap.moilion.com;
  location / {
    proxy_pass_request_headers on;
    proxy_set_header host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_pass http://127.0.0.1:10080;
  }
}
```
# 3. change password
default password is `lam`

http://ldap.moilion.com/lam/templates/config/index.php
`Edit general settings` and `Edit server profiles`

