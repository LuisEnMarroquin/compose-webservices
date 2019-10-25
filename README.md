# nginx-docker-compose

* Add to this file: `C:\Windows\System32\drivers\etc\hosts`

```
127.0.0.1 localhost.com
127.0.0.1 whoami.localhost.com
```

curl -H "Host: whoami.localhost.com" localhost

* docker-compose --project-name nginx up -d --build --force-recreate --remove-orphans
* docker-compose --project-name nginx stop
* docker system prune --volumes

## Create .env file

```shell
EMAIL=example@example.com
DOMAIN=example.com
```
