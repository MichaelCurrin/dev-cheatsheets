---
title: Docker compose
description: A tool that makes docker containers easier to manage
---

Docker compose allows orchestration of multiple containers. It allows you to store and run parameters against those containers without typing each time.


## Requirements

You need the following:

- `Dockerfile`
    - You could actually skip this if you use a prebuilt Ubuntu image for example but typically you'll use `Dockerfile` with `docker-compose`.
    - You can have multiple `Dockerfile` files in different folders or within differ names. These each get used by the next part.
- `docker-compose.yml`
    - Single config file for one or more containers
    - Allows configuration of volumes, port numbers, network settings, etc.

When you run this, it will use the two files above.

```sh
$ docker-compose SUBCOMMAND
```


## Note

Since around the start of 2021, you get this message from Docker Compose

> Docker Compose is now in the Docker CLI, try `docker compose up`

So instead of:

```sh
$ docker-compose up
```

Use

```sh
$ docker compose up
```

Either way, an alias makes it much easier to type.

```sh
$ alias dc='docker compose'
$ dc up
```


## Build

### Initial build

Build images.

```sh
$ docker-compose build
```

Start containers. If the above step was skipped, the image build will happen now.

```sh
$ docker-compose up
```

If the container has a long-running task like a server, it will stay up. Stop it with <kbd>CTRL</kbd>+<kbd>C</kbd>.

Or it will exit immediately.

```sh
$ docker-compose up
Starting foo_bar_1 ... done
Attaching to foo_bar_1
```

Start containers again.

```sh
$ docker-compose up
```

That will **not** rebuild the image but use already built image. If you copied your codebase into the image using `COPY` in `Dockerfile`, then the image will have stale code. 

Continue below to remedy this.

### Rebuild

Add the latest code to the image by forcing a build.

This is necessary as `up` alone will not rebuild, even if you delete the containers.

```sh
$ docker-compose build
$ docker-compose up
```

Or in one command:

```sh
$ docker-compose up --build
```

### Scale

Setup multiple instances of a container locally.

Use the `--scale` flag.

```sh
$ docker-compose up --build --remove-orphans --scale my-app=3
```


## Start

### As the main process

```sh
$ docker-compose up
```

Stop it with <kbd>CTRL</kbd>+<kbd>C</kbd>.


### As a background process

Start with `-d` for daemon:

```sh
$ docker-compose up -d
```

Stop the containers - this can be done from another terminal tab if needed.

```sh
$ docker-compose stop
```

### Using run command

If you container exited immediately when using `up`, you could use `run` instead, against the name of a service listed in `docker-compose.yml`.

```sh
$ docker-compose run SERVICE
$ # e.g.
$ docker-compose run foo
```

If you have no commands specified in the `Dockerfile`, this will start an interactive shell session in teh container.

You can exit with `exit` command or hit <kbd>CTRL</kbd>+<kbd>D</kbd>.

Your container will be stopped but kept.

When you use `run` again using the command aboeb, it will spin up a **new** container under a new ID.

You can add `--rm` command to delete the container each time. Note you will **lose** data in the container unless you persist in a volume.

```sh
$ docker-compose run --rm SERVICE
```

See [docker-compose run](https://docs.docker.com/compose/reference/run/) docs.

```
Usage:
    run [options] [-v VOLUME...] [-p PORT...] [-e KEY=VAL...] [-l KEY=VALUE...]
        SERVICE [COMMAND] [ARGS...]
```

### Using exec command

Run a command against an **already running** container. This avoids spinning up duplicate containers, but may not be practical if you container doesn't have a command to keep it running.

See [docker-compose exec](https://docs.docker.com/compose/reference/exec/) docs.

> This is the equivalent of docker exec. With this subcommand you can run arbitrary commands in your services.

Usage:

```
Usage: exec [options] [-e KEY=VAL...] SERVICE COMMAND [ARGS...]
```

```sh
$ docker-compose exec SERVICE COMMAND
```

Example of using `web` service with interactive prompt, as recommended in docs:

```sh
$ docker-compose exec web sh
```


## Delete

Stop and delete containers. Warning - you will lose any data in the container.

```sh
docker-compose down
```


## Choose config

```sh
$ docker-compose -f "docker-compose.yml" ARGS
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
