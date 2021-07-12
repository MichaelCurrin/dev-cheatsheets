---
description: Guide to running CLI commands with `docker` - the container management tool
logo: docker
---
# Docker CLI


## Resources

- Cheatsheets
    - [Docker.com](https://www.docker.com/sites/default/files/d8/2019-09/docker-cheat-sheet.pdf) homepage.
    - [Docker](https://devhints.io/docker) on DevHints.
    - [wsargent/docker-cheat-sheet](https://github.com/wsargent/docker-cheat-sheet) on _GitHub_.
    - [Ultimate Docker Cheatsheet](https://hackernoon.com/docker-commands-the-ultimate-cheat-sheet-994ac78e2888) as _Hackernoon_ blog post.
    - [Docker cheatsheet](https://dockerlabs.collabnix.com/docker/cheatsheet/) on Dockerlabs.

See also my [Docker shell-only basics](https://github.com/MichaelCurrin/docker-quickstarts/blob/master/shell-basics.md) inside my `docker-quickstarts` repo.


## Help

```sh
$ docker --help
```

<details>
<summary>Output</summary>

<pre>

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

</pre>

</details>


## Common commands

From [source](https://www.mankier.com/1/docker#Examples_(TL;DR)).

Command | Description
--- | ---
`docker ps` | List currently running docker containers: 
`docker ps -a` | List all docker containers (running and stopped)
`docker run --rm IMAGE` | Start a container from an image, with a random name
`docker run  --rm --name CONTAINER_NAME IMAGE` |  Start a container from an image, with a custom name
`docker run --rm -p 80:8080 IMAGE` | Expose and publish ports of a server
`docker start|stop CONTAINER_NAME` | Start or stop an existing container
`docker pull IMAGE` | Pull an image from a docker registry
`docker exec -it CONTAINER_NAME bash` | Open a shell inside of an already running container
`docker rm CONTAINER_NAME` |  Remove a stopped container: 
`docker logs -f CONTAINER_NAME` |  Fetch and follow the logs of a container


## Summary of commands

From [How to Use Docker Images, Containers, and Dockerfiles](https://medium.com/swlh/how-to-use-docker-images-containers-and-dockerfiles-39e4e8fc181a)

### Manage Images

```sh
$ docker build -t my-node-img .
$ docker image ls my-node-img
$ docker image ls
```

### Manage containers

- Check Linux version.
    ```sh
    $ docker run node:12-slim \
        cat /etc/issue
    ```
- Show a specific container
    ```sh
    $ docker ps -a \
        --filter "name=my-app"
    ```
- Show all running containers.
    ```sh
    $ docker ps
    ```
- See containers logs (recommended).
    ```sh
    $ docker logs -f my-app
    ```
- Create - I don't think I've ever run `create`.
    ```sh
    $ docker create --init \
        --name my-app \
        -p 3000:3000 \
        my-node-img
    ```
- Start
    ```sh
    $ docker start my-app
    ```
- Access container's system.
    ```sh
    $ docker exec -it my-app bash
    ```
- Run
    ```sh
    $ docker run --name my-app \
        -p 3000:3000 \
        -d \
        --init \
        --rm \
        my-node-img
    ```
- Attach to a container (not recommended).
    ```sh
    $ docker attach my-app
    ```

### Stop and remove container

Stop a running container.

```sh
$ docker stop my-app
```

Stop **all** running containers. This uses `--quiet` flag return only the container IDs.

```sh
$ docker stop $(docker ps -q)
```

Remove a stopped container.

```sh
$ docker rm my-app
```


## How to run containers
> Using `run`, `start` and `exec`

Links:

- Docker CLI reference:
	- [run](https://docs.docker.com/engine/reference/run/)
	- [exec](https://docs.docker.com/engine/reference/commandline/exec/)
		> The `docker exec` command runs a new command in a running container.
- [What is the different between “run” and “exec”](https://chankongching.wordpress.com/2017/03/17/docker-what-is-the-different-between-run-and-exec/)

Run a command in a **new** container. The container will then stop when it is finished, unless it continues to run like for a server.

```sh
$ docker run IMAGE
$ docker run IMAGE COMMAND
```

e.g.

```sh
$ docker run my-image
$ docker run my-image bash
```

Optionally give the container name.

```sh
$ docker run --rm --name CONTAINER_NAME IMAGE
```

e.g.

```sh
$ docker run --rm \
    --name my-app \
    my-image
```

Run a command in an **existing** and **running** container, given a tagged name or ID.

```sh
$ docker start CONTAINER_NAME
$ docker exec CONTAINER_NAME
```

That is useful if you want to tunnel in and use an interactive session with Bash, Python, etc.

```sh
$ docker exec -it CONTAINER bash
```

If you container exits immediately when it run, you'll struggle to `exec` into it.

So then use `run` against a built image. Set a **new** container from a given image, deleting the container when done. Pass a shell entry point.

```sh
$ docker run --rm -it \
    IMAGE \
    --entrypoint bash
```

In VS Code, under the Docker extension and "Images" you can select an image and "Run interactive" to achieve the same thing. Though, you might start with Node or something else, as you can't specify Bash.

Start an interactive Node console in a downloaded `node` image.

```sh
$ docker run -it node
>
```

```sh
$ docker run -it node bash
#
```

### Open ports

Expose and publish ports.

Format:

- `--publish EXTERNAL:INTERNAL`

With that flag, that you don't need `EXPOSE` in the `Dockerfile`. Also, using `EXPOSE` alone doesn't publish.

Example:

```sh
$ docker run --rm -p 80:8080 node-app
```

The Node app will serve on port `8080` and Docker routes that port `80` on the host.

### Start shell

Start an interactive Bash shell in the container by setting the entrypoint. This overrides whatever value was set in the `Dockerfile` for `ENTRYPOINT`.

```sh
$ docker run -it my-app bash
```

Or with more verbose `--entrypoint ENTRYPOINT` flag.

Note that flags must come _before_ the app name.

```sh
$ docker run -it --entrypoint bash my-app 
```


## List

Show running containers.

```sh
$ docker ps
```

Show running and stopped containers - `--all`.

```sh
$ docker ps -a
```

Show images.

```sh
$ docker images
```


## Clean

Remove unused data.

```sh
$ docker system prune [OPTIONS]
```

| Options      | Description                                      |
| ------------ | ------------------------------------------------ |
| `--all`, `-a`   | Remove all unused images not just dangling ones. |
| `--force`, `-f` | Do not prompt for confirmation                   |


With no options, you will get a confirmation prompt and told that these will be removed:

- all stopped containers
- all networks not used by at least one container
- all dangling images
- all build cache

[source](https://docs.docker.com/engine/reference/commandline/system_prune/)

Remove images:

```sh
$ docker image prune
```

## Copy
> Copy files/folders between a container and the local filesystem

Copy files or from a container.

See [cp](https://docs.docker.com/engine/reference/commandline/cp/) docs.

### Usage

```
docker cp [OPTIONS] CONTAINER:SRC_PATH DEST_PATH|-
docker cp [OPTIONS] SRC_PATH|- CONTAINER:DEST_PATH
```

### Examples

Copy the entire directory and create a directory of the same name.

```sh
$ docker cp foo my-app:/root/app
# => /root/app/foo
```

Copy contents of directory into a directory - using dot forwardlash in destination, as per the docs.

```sh
$ docker cp foo my-app:/root/app/foo/.
# => /root/app/foo
```

