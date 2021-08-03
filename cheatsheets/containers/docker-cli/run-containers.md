# Run containers
> How to use `run`, `start` and `exec` subcommands against a container

## Links

- Docker CLI reference:
	- [run](https://docs.docker.com/engine/reference/run/)
	- [exec](https://docs.docker.com/engine/reference/commandline/exec/)
		> The `docker exec` command runs a new command in a running container.
- [What is the different between “run” and “exec”](https://chankongching.wordpress.com/2017/03/17/docker-what-is-the-different-between-run-and-exec/)


## Run in new container

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

## Run in existing

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


## Interactive

Start an interactive Node console in a downloaded `node` image.

```sh
$ docker run -it node
>
```

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
