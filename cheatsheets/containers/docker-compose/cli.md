---
title: CLI
---



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
$ docker compose SUBCOMMAND
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
$ docker compose build
```

Start containers. If the above step was skipped, the image build will happen now.

```sh
$ docker compose up
```

If the container has a long-running task like a server, it will stay up. Stop it with <kbd>CTRL</kbd>+<kbd>C</kbd>.

Or it will exit immediately.

```sh
$ docker compose up
Starting foo_bar_1 ... done
Attaching to foo_bar_1
```

Start containers again.

```sh
$ docker compose up
```

That will **not** rebuild the image but use already built image. If you copied your codebase into the image using `COPY` in `Dockerfile`, then the image will have stale code.

Continue below to remedy this.

### Rebuild

Add the latest code to the image by forcing a build.

This is necessary as `up` alone will not rebuild, even if you delete the containers.

```sh
$ docker compose build
$ docker compose up
```

Or in one command:

```sh
$ docker compose up --build
```

### Scale

Set up multiple instances of a container locally.

Use the `--scale` flag.

```sh
$ docker-compose up --build --remove-orphans --scale my-app=3
```


## Start

### As the main process

```sh
$ docker compose up
```

Stop it with <kbd>CTRL</kbd>+<kbd>C</kbd>.


### As a background process

Start with `-d` for daemon:

```sh
$ docker compose up -d
```

Stop the containers - this can be done from another terminal tab if needed.

```sh
$ docker compose stop
```

### Using run command

If you container exited immediately when using `up`, you could use `run` instead, against the name of a service listed in `docker-compose.yml`.

```sh
$ docker compose run SERVICE
$ # e.g.
$ docker compose run foo
```

If you have no commands specified in the `Dockerfile`, this will start an interactive shell session in teh container.

You can exit with `exit` command or hit <kbd>CTRL</kbd>+<kbd>D</kbd>.

Your container will be stopped but kept.

When you use `run` again using the command aboeb, it will spin up a **new** container under a new ID.

You can add `--rm` command to delete the container each time. Note you will **lose** data in the container unless you persist in a volume.

```sh
$ docker compose run --rm SERVICE
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
$ docker compose exec web sh
```


## Delete

Stop and then delete containers. Warning - you will **lose** any data in the container.

```sh
$ docker compose down
```

To delete volumes too:

```sh
$ docker compose down --volumes
```


## Choose config

```sh
$ docker compose -f "docker-compose.yml" ARGS
```


## Usage

See the link at the top of this page for CLI usage info or see below.

### Help

```sh
$ docker compose -h
```

```
Docker Compose

Usage:
  docker compose [command]

Available Commands:
  build       Build or rebuild services
  convert     Converts the compose file to platform's canonical format
  create      Creates containers for a service.
  down        Stop and remove containers, networks
  events      Receive real time events from containers.
  exec        Execute a command in a running container.
  kill        Force stop service containers.
  logs        View output from containers
  ls          List running compose projects
  pause       pause services
  port        Print the public port for a port binding.
  ps          List containers
  pull        Pull service images
  push        Push service images
  restart     Restart containers
  rm          Removes stopped service containers
  run         Run a one-off command on a service.
  start       Start services
  stop        Stop services
  top         Display the running processes
  unpause     unpause services
  up          Create and start containers

Flags:
      --ansi string                Control when to print ANSI control characters ("never"|"always"|"auto") (default "auto")
      --env-file string            Specify an alternate environment file.
  -f, --file stringArray           Compose configuration files
  -h, --help                       help for compose
      --profile stringArray        Specify a profile to enable
      --project-directory string   Specify an alternate working directory
                                   (default: the path of the Compose file)
  -p, --project-name string        Project name

Use "docker compose [command] --help" for more information about a command.
```
