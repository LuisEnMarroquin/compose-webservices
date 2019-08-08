## Run app
```shell
docker build -t my-python-app .
docker run -it --rm --name my-running-app my-python-app
docker-compose --project-name python up -d --build --force-recreate --remove-orphans
```