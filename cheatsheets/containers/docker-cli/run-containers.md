# Run containers
> How to use `run`, `start` and `exec` subcommands against a container


## Links

- Docker CLI reference:
	- [run](https://docs.docker.com/engine/reference/run/)
	- [exec](https://docs.docker.com/engine/reference/commandline/exec/)
		> The `docker exec` command runs a new command in a running container.
- [What is the different between “run” and “exec”](https://chankongching.wordpress.com/2017/03/17/docker-what-is-the-different-between-run-and-exec/)


## Overview

- Start an existing container.
    ```sh
    $ docker start my-app
    ```
- Access the container's system.
    ```sh
    $ docker exec -it my-app bash
    ```
- Run a container. Use `--rm` to delete it.
    ```sh
    $ docker run \
        --rm \
        --name my-app \
        -p 3000:3000 \
        -d \
        --init \
        my-node-img
    ```


## Run in new container

Run a command in a **new** container. The container will then stop when it is finished, unless it continues to run like for a server.

```sh
$ docker run IMAGE
$ docker run IMAGE COMMAND
```

The container will get a different random name on each run and you'll end up with a lot of containers unless you use `rm` to delete it each time.

e.g.

This will do nothing and then exit.

```sh
$ docker run python:3.9
```

Use default entry-point (in this case Python terminal) and use interactive mode.

```sh
$ docker run -it -rm python:3.9
```

Specify shell as entry-point and interactive mode. 

```sh
$ docker run -it -rm python:3.9 bash
```

Give the container name if you want. This can be useful if you have long-running container like a server. You'll want to use the `rm` flag otherwise you'll get an error on the 2nd run that the container name already is used.

```sh
$ docker run -rm --name CONTAINER_NAME IMAGE
```

e.g.

```sh
$ docker run --rm \
    --name my-app \
    python:3.9
```


## Run in existing

Run a command in an **existing** and **running** container, given a tagged name or ID.

1. Create the container:
    ```sh
    $ docker run IMAGE --name CONTAINER_NAME
    ```
1. Start it:
    ```sh
    $ docker start CONTAINER_NAME
    ```
1. Execute inside it:
    ```sh
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


## Interactive

Start an interactive Node console in a target image.

e.g. 

Node image, with `node` as default entrypoint.

```sh
$ docker run -it node
>
```

Node image, with `bash` as custom entrypoint.

```sh
$ docker run -it node bash
#
```


## Open ports

Expose and publish ports.

Format:

- `--publish EXTERNAL:INTERNAL`

With that flag, that you don't need `EXPOSE` in the `Dockerfile`. Also, using `EXPOSE` alone doesn't publish.

Example:

```sh
$ docker run --rm -p 80:8080 node-app
```

The Node app will serve on port `8080` and Docker routes that port `80` on the host.


## Network

From [Network settings](https://docs.docker.com/engine/reference/run/#network-settings).

```
--network="bridge" : Connect a container to a network
                      'bridge': create a network stack on the default Docker bridge
                      'none': no networking
                      'container:<name|id>': reuse another container's network stack
                      'host': use the Docker host network stack
                      '<network-name>|<network-id>': connect to a user-defined network
```

e.g. If `my-network` was created by Docker Compose and you want to add a container to that network.

```sh
$ docker run --network='my-network'
```

## Start shell

Start an interactive Bash shell in the container by setting the entrypoint. This overrides whatever value was set in the `Dockerfile` for `ENTRYPOINT`.

```sh
$ docker run -it my-app bash
```

Or with more verbose `--entrypoint ENTRYPOINT` flag.

Note that flags must come _before_ the app name.

```sh
$ docker run -it --entrypoint bash my-app 
```


## Avoid

- Create - I don't think I've ever had to run `create`.
    ```sh
    $ docker create --init \
        --name my-app \
        -p 3000:3000 \
        my-node-img
    ```
- Attach to a container (not recommended).
    ```sh
    $ docker attach my-app
    ```
