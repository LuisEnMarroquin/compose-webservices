# compose-webservices

Multiple webservices using `docker-compose`, behind `nginx-proxy`

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
docker-compose --project-name nginx up -d --build --force-recreate --remove-orphans
```

### Coder

```shell
docker-compose --project-name code -f docker-codeserver.yml up -d --build --force-recreate --remove-orphans
```

### Gitlab

```shell
docker-compose --project-name gitlab -f docker-gitlab.yml up -d --build --force-recreate --remove-orphans
```

### Jenkins

```shell
docker-compose --project-name jenkins -f docker-jenkins.yml up -d --build --force-recreate --remove-orphans
```

### Netdata

```shell
docker-compose --project-name netdata -f docker-netdata.yml up -d --build --force-recreate --remove-orphans
```

### Portainer

```shell
docker-compose --project-name portainer -f docker-portainer.yml up -d --build --force-recreate --remove-orphans
```

Generate new htpasswd

```shell
docker run --rm httpd:2.4-alpine htpasswd -nbB admin <password> | cut -d ":" -f 2
```

* If any password passed though cli has an `$` you must escape it using double `$$`

## Test if it works locally

You can test that this actually worked locally without any changes

### Linux CLI

If it works you'll see the something like `I'm 999999999` after running the following command:

```shell
curl -H "Host: whoami.localhost.com" localhost
```

### Windows

Add the following lines to this file (admin is required): `C:\Windows\System32\drivers\etc\hosts`

```shell
127.0.0.1 localhost.com
127.0.0.1 whoami.localhost.com
127.0.0.1 portainer.localhost.com
```

Then visit `whoami.localhost.com` with any web browser

## Watch large workspace VSCode

* Follow this [guide](https://code.visualstudio.com/docs/setup/linux#_visual-studio-code-is-unable-to-watch-for-file-changes-in-this-large-workspace-error-enospc)
