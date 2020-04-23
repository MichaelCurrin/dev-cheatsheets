# Docker compose cheatsheet

- [Docker compose reference docs](https://docs.docker.com/compose/reference/overview/)

Docker compose allows orchestration of multiple containers and it allows you to store and run parameters against those. T

## Build

### Initial build

Build images.

```sh
docker-compose build
```

Start containers. If the above step was skipped, the build will happen now.

```sh
docker-compose up
```

Stop it with <kbd>CTRL+C</kbd>

Start containers again. This will **not** rebuild the image.

```sh
docker-compose up
```

### Rebuild

Add the latest code to the image by forcing a build.

This is necessary as `up` alone will not rebuild, even if you delete the containers.

```sh
docker-compose build
docker-compose up
```

Or, in one command.

```sh
docker-compose up --build
```

## Start

### As main process

```sh
docker-compose up
```

Stop it with <kbd>CTRL+C</kbd>


### As background process

Start using `-d` for daemon.

```sh
docker-compose up -d
```

Stop the containers - this can be done from another terminal tab if needed.

```sh
docker-compose stop
```


## Delete

Stop and delete containers. Warning - you will lose any data in the container.

```sh
docker-compose down
```

<!--stackedit_data:
eyJoaXN0b3J5IjpbLTQ3NDk2OTQxLC03MDI3NjMyNDgsLTE5OD
kyNzA1NTldfQ==
-->