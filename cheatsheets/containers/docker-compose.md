---
title: Docker compose
description: The tool that makes docker containers easier to manage
---

See the [Overview of docker-compose CLI](https://docs.docker.com/compose/reference/overview/) reference docs.

Docker compose allows orchestration of multiple containers and it allows you to store and run parameters against those. Such as normally when you run a `docker` command with a port number.


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

Stop it with <kbd>CTRL</kbd>+<kbd>C</kbd>.

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


## Choose config

```sh
$ docker-compose -f "docker-compose.yml" CMD
```


## Usage

See the link at the top of this page for CLI usage info or see below.

### Man page

```sh
$ docker-compose --help
```

```
Define and run multi-container applications with Docker.

Usage:
  docker-compose [-f <arg>...] [options] [COMMAND] [ARGS...]
  docker-compose -h|--help

Options:
  -f, --file FILE             Specify an alternate compose file
                              (default: docker-compose.yml)
  -p, --project-name NAME     Specify an alternate project name
                              (default: directory name)
  --verbose                   Show more output
  --log-level LEVEL           Set log level (DEBUG, INFO, WARNING, ERROR, CRITICAL)
  --no-ansi                   Do not print ANSI control characters
  -v, --version               Print version and exit
  -H, --host HOST             Daemon socket to connect to

  --tls                       Use TLS; implied by --tlsverify
  --tlscacert CA_PATH         Trust certs signed only by this CA
  --tlscert CLIENT_CERT_PATH  Path to TLS certificate file
  --tlskey TLS_KEY_PATH       Path to TLS key file
  --tlsverify                 Use TLS and verify the remote
  --skip-hostname-check       Don't check the daemon's hostname against the
                              name specified in the client certificate
  --project-directory PATH    Specify an alternate working directory
                              (default: the path of the Compose file)
  --compatibility             If set, Compose will attempt to convert keys
                              in v3 files to their non-Swarm equivalent
  --env-file PATH             Specify an alternate environment file

Commands:
  build              Build or rebuild services
  config             Validate and view the Compose file
  create             Create services
  down               Stop and remove containers, networks, images, and volumes
  events             Receive real time events from containers
  exec               Execute a command in a running container
  help               Get help on a command
  images             List images
  kill               Kill containers
  logs               View output from containers
  pause              Pause services
  port               Print the public port for a port binding
  ps                 List containers
  pull               Pull service images
  push               Push service images
  restart            Restart services
  rm                 Remove stopped containers
  run                Run a one-off command
  scale              Set number of containers for a service
  start              Start services
  stop               Stop services
  top                Display the running processes
  unpause            Unpause services
  up                 Create and start containers
  version            Show the Docker-Compose version information
  ```
