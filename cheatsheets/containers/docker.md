---
title: Docker
---

## Resources

- Cheatsheets
    - [Docker.com](https://www.docker.com/sites/default/files/d8/2019-09/docker-cheat-sheet.pdf).
    - [Devhints](https://devhints.io/docker).
    - [wsargent/docker-cheat-sheet](https://github.com/wsargent/docker-cheat-sheet) on _Github_.
    - [Ultimate Docker Cheatsheet](https://hackernoon.com/docker-commands-the-ultimate-cheat-sheet-994ac78e2888) as _Hackernoon_ blog post.
    - [Docker cheatsheet](http://dockerlabs.collabnix.com/docker/cheatsheet/) on Dockerlabs.


## Common commands

[source](https://www.mankier.com/1/docker#Examples_(TL;DR))

-   List currently running docker containers: `docker ps`
-   List all docker containers (running and stopped): `docker ps -a`
-   Start a container from an image, with a custom name: `docker run --name container_name image`
-   Start or stop an existing container: `docker start|stop container_name`
-   Pull an image from a docker registry: `docker pull image`
-   Open a shell inside of an already running container: `docker exec -it container_name sh`
-   Remove a stopped container: `docker rm container_name`
-   Fetch and follow the logs of a container: `docker logs -f container_name`


## Clean

Remove unused data.

```sh
$ docker system prune [OPTIONS]
```

| Options      | Description                                      |
| ------------ | ------------------------------------------------ |
| --all , -a   | Remove all unused images not just dangling ones. |
| --force , -f | Do not prompt for confirmation                   |


With no options, you will get a confirmation prompt and told that these will be removed:

- all stopped containers
- all networks not used by at least one container
- all dangling images
- all build cache

[source](https://docs.docker.com/engine/reference/commandline/system_prune/)

Remove images.

```sh
docker image prune
```

## Run

Links:

- Docker CLI reference:
	- [run](https://docs.docker.com/engine/reference/run/)
	- [exec](https://docs.docker.com/engine/reference/commandline/exec/)
		> The `docker exec` command runs a new command in a running container.
- [What is the different between “run” and “exec”](https://chankongching.wordpress.com/2017/03/17/docker-what-is-the-different-between-run-and-exec/)

Run a command in a **new** container. The container will then stop.

```sh
docker run CONTAINER COMMAND
```

Run a command in an **existing** container.

```sh
docker start
docker exec CONTAINER
```

Useful if you want to tunnel in and use an interactive session with Bash, Python, etc.

```sh
docker exec -it CONTAINER bash
```

Ad hoc entry point to start an container even if normally exists immediately and then start interactive terminal.

```sh
docker run  --entrypoint bash -it IMAGE
```

You'll start a new container each time though.


## Man page

```sh
docker --help
```

```
Usage:	docker [OPTIONS] COMMAND

A self-sufficient runtime for containers

Options:
      --config string      Location of client config files (default "/Users/mcurrin/.docker")
  -c, --context string     Name of the context to use to connect to the daemon (overrides DOCKER_HOST env var and default context set with "docker context use")
  -D, --debug              Enable debug mode
  -H, --host list          Daemon socket(s) to connect to
  -l, --log-level string   Set the logging level ("debug"|"info"|"warn"|"error"|"fatal") (default "info")
      --tls                Use TLS; implied by --tlsverify
      --tlscacert string   Trust certs signed only by this CA (default "/Users/mcurrin/.docker/ca.pem")
      --tlscert string     Path to TLS certificate file (default "/Users/mcurrin/.docker/cert.pem")
      --tlskey string      Path to TLS key file (default "/Users/mcurrin/.docker/key.pem")
      --tlsverify          Use TLS and verify the remote
  -v, --version            Print version information and quit

Management Commands:
  builder     Manage builds
  checkpoint  Manage checkpoints
  config      Manage Docker configs
  container   Manage containers
  context     Manage contexts
  image       Manage images
  network     Manage networks
  node        Manage Swarm nodes
  plugin      Manage plugins
  secret      Manage Docker secrets
  service     Manage services
  stack       Manage Docker stacks
  swarm       Manage Swarm
  system      Manage Docker
  trust       Manage trust on Docker images
  volume      Manage volumes

Commands:
  attach      Attach local standard input, output, and error streams to a running container
  build       Build an image from a Dockerfile
  commit      Create a new image from a container's changes
  cp          Copy files/folders between a container and the local filesystem
  create      Create a new container
  deploy      Deploy a new stack or update an existing stack
  diff        Inspect changes to files or directories on a container's filesystem
  events      Get real time events from the server
  exec        Run a command in a running container
  export      Export a container's filesystem as a tar archive
  history     Show the history of an image
  images      List images
  import      Import the contents from a tarball to create a filesystem image
  info        Display system-wide information
  inspect     Return low-level information on Docker objects
  kill        Kill one or more running containers
  load        Load an image from a tar archive or STDIN
  login       Log in to a Docker registry
  logout      Log out from a Docker registry
  logs        Fetch the logs of a container
  pause       Pause all processes within one or more containers
  port        List port mappings or a specific mapping for the container
  ps          List containers
  pull        Pull an image or a repository from a registry
  push        Push an image or a repository to a registry
  rename      Rename a container
  restart     Restart one or more containers
  rm          Remove one or more containers
  rmi         Remove one or more images
  run         Run a command in a new container
  save        Save one or more images to a tar archive (streamed to STDOUT by default)
  search      Search the Docker Hub for images
  start       Start one or more stopped containers
  stats       Display a live stream of container(s) resource usage statistics
  stop        Stop one or more running containers
  tag         Create a tag TARGET_IMAGE that refers to SOURCE_IMAGE
  top         Display the running processes of a container
  unpause     Unpause all processes within one or more containers
  update      Update configuration of one or more containers
  version     Show the Docker version information
  wait        Block until one or more containers stop, then print their exit codes

Run 'docker COMMAND --help' for more information on a command.
```
