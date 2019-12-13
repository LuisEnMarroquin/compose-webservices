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
docker-compose --project-name nginx up -d --force-recreate --remove-orphans
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
127.0.0.1 code.localhost.com
127.0.0.1 whoami.localhost.com
127.0.0.1 gitlab.localhost.com
127.0.0.1 jenkins.localhost.com
127.0.0.1 netdata.localhost.com
127.0.0.1 portainer.localhost.com
```

Then visit `whoami.localhost.com` with any web browser

## Watch large workspace VSCode

* Follow this [guide](https://code.visualstudio.com/docs/setup/linux#_visual-studio-code-is-unable-to-watch-for-file-changes-in-this-large-workspace-error-enospc)

## MySQL

```shell
# Get inside container
docker exec -it wordpress_db_1 /bin/bash
# Login into MySQL as root
mysql -p # Will show you an interactive prompt to enter your password
mysql -pp92ls8qkau28 # Add your password in the same line // No space between -p and the password text
# Login into MySQL as user
mysql -u exampleuser -h localhost -p
mysql -u exampleuser -h localhost -pp92ls8qkau28
```
# code-server

`code-server` is [VS Code](https://github.com/Microsoft/vscode) running on a
remote server, accessible through the browser.

- **Consistent environment:** Code on your Chromebook, tablet, and laptop with a
  consistent dev environment. develop more easily for Linux if you have a
  Windows or Mac, and pick up where you left off when switching workstations.
- **Server-powered:** Take advantage of large cloud servers to speed up tests,
  compilations, downloads, and more. Preserve battery life when you're on the go
  since all intensive computation runs on your server.

### Requirements

- Minimum GLIBC version of 2.17 and a minimum version of GLIBCXX of 3.4.15.
  - This is the main requirement for building Visual Studio Code. We cannot go lower than this.
- A 64-bit host with at least 1GB RAM and 2 cores.
  - 1 core hosts would work but not optimally.
- Docker (for Docker versions of `code-server`).

### Digital Ocean

[Create a Droplet](https://m.do.co/c/856dc39cd657)

### Known Issues

- Creating custom VS Code extensions and debugging them doesn't work.
- Extension profiling and tips are currently disabled.

### Extensions

`code-server` does not provide access to the official
[Visual Studio Marketplace](https://marketplace.visualstudio.com/vscode). Instead,
Coder has created a custom extension marketplace that we manage for open-source
extensions. If you want to use an extension with code-server that we do not have
in our marketplace please look for a release in the extension’s repository,
contact us to see if we have one in the works or, if you build an extension
locally from open source, you can copy it to the `extensions` folder. If you
build one locally from open-source please contribute it to the project and let
us know so we can give you props! If you have your own custom marketplace, it is
possible to point code-server to it by setting the `SERVICE_URL` and `ITEM_URL`
environment variables.

### Telemetry

Use the `--disable-telemetry` flag to completely disable telemetry. We use the
data collected to improve code-server.

### Upgrading VS Code

Please don't

### License

[MIT](LICENSE)
