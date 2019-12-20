# compose-webservices

Multiple webservices using `docker-compose` or `swarm`, behind `nginx-proxy`

## Create `.env` file

Create a file to store your environment variables

```shell
# Email for letsencrypt cert renew
EMAIL=me@localhost.com
# You server's domain name
DOMAIN=localhost.com
```

## Start services

At first you need to start the `nginx` service, it includes `nginx`, `letsencrypt` and `whoami` containers

```shell
docker-compose --project-name nginx -f docker-compose.yml  up -d --force-recreate --remove-orphans
```

### Coder

```shell
docker-compose --project-name code -f docker-code.yml up -d --build --force-recreate --remove-orphans
```

### Gitlab

```shell
docker-compose --project-name gitlab -f docker-gitlab.yml up -d --force-recreate --remove-orphans
```

### Jenkins

```shell
docker-compose --project-name jenkins -f docker-jenkins.yml up -d --force-recreate --remove-orphans
```

### Netdata

```shell
docker-compose --project-name netdata -f docker-netdata.yml up -d --force-recreate --remove-orphans
```

### Portainer

```shell
docker-compose --project-name portainer -f docker-portainer.yml up -d --force-recreate --remove-orphans
```

Generate new htpasswd, edit `command` property on `docker-portainer.yml`

```shell
docker run --rm httpd:2.4-alpine htpasswd -nbB admin <password> | cut -d ":" -f 2
```

* If any password passed though cli has an `$` you must escape it using double `$$`

### Node

A simple docker-compose example combining Nginx, Node and Mongo, this works by itself and shouldn't run with the other nginx instance. This part was obtained from this [post](https://medium.com/faun/learn-docker-in-5-days-day-5-docker-compose-11af7b9298db).

```shell
docker-compose --project-name node -f docker-node.yml up -d --force-recreate --remove-orphans
```

* See nginx running at: [localhost](http://localhost.com)
* See node app running at: [localhost/node](http://localhost.com/node)

## Test if it works locally

Use **cURL** it works you'll see the something like **I'm 999999999**:

```shell
curl -H "Host: whoami.localhost.com" localhost
```

If you have **Windows** or **macOS** add the following on:

* macOS: `/etc/hosts`
* Windows: `C:\Windows\System32\drivers\etc\hosts`

```shell
127.0.0.1 localhost.com
127.0.0.1 code.localhost.com
127.0.0.1 whoami.localhost.com
127.0.0.1 gitlab.localhost.com
127.0.0.1 jenkins.localhost.com
127.0.0.1 netdata.localhost.com
127.0.0.1 portainer.localhost.com
127.0.0.1 wordpress.localhost.com
127.0.0.1 db.wordpress.localhost.com
```

Then visit [whoami.localhost.com](http://whoami.localhost.com)` with your favorite browser

## Digital Ocean

[Create a Droplet](https://m.do.co/c/856dc39cd657)

## Watch large workspace VSCode

* Follow this [guide](https://code.visualstudio.com/docs/setup/linux#_visual-studio-code-is-unable-to-watch-for-file-changes-in-this-large-workspace-error-enospc)
