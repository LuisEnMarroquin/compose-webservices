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

## Watch large workspace VSCode
```shell
cat /proc/sys/fs/inotify/max_user_watches
sudo echo 'fs.inotify.max_user_watches=524288' >> /etc/sysctl.conf
sudo sysctl -p
cat /proc/sys/fs/inotify/max_user_watches
```
