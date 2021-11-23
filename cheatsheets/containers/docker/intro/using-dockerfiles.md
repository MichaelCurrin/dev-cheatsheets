# Using Dockerfiles


## What is a Dockerfile?

See [Dockerfile reference](https://docs.docker.com/engine/reference/builder/) in the Docker docs.


## An example

Copied from [Best practices for writing Dockerfiles](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)

```dockerfile
FROM ubuntu:18.04
COPY . /app
RUN make /app
CMD python /app/app.py
```

Each instruction creates one layer:

> - `FROM` creates a layer from the ubuntu:18.04 Docker image.
> - `COPY` adds files from your Docker client’s current directory.
> - `RUN` builds your application with make.
> - `CMD` specifies what command to run within the container.


## General pattern

Here is an outline of a typical `Dockerfile`.

```dockerfile
FROM ...

RUN ...
RUN ...
RUN ...

WORKDIR ...

COPY ... ...
RUN ...

ENTRYPOINT ...
CMD ...
```


## What do the pieces do?


### FROM

The `FROM` line specifies the base image, usually Linux flavor (e.g. `ubuntu`) or a specialized container such as for Python or NodeJS.

If the target image does not exist yet, Docker will download it. On later build or run commands, that image will be reused from the cache.

If you want to download an image independently of using it in a `FROM` line, you can run:

```sh
$ docker pull IMAGE
```

### RUN

There are usually some `RUN` commands when building the image.

  - This is usually a command to **update** the APT package listing. This is usually required or the next step will fail.
      ```sh
      RUN apt-get update
      ```
  - Then there is a step to install packages. It is useful to add the `-q` quiet flag for cleaner output and the `-y` yes flag to install without asking the user to confirm.
      ```sh
      RUN apt-get update
      ```
  - The `RUN` command can also be used for other commands such as changing permissions, moving files, or downloading and unzipping a file from a URL.

### WORKDIR

Set the working directory to a custom value.

This defaults to `~` - that would be `/root`.

### COPY

There is sometimes a `COPY` commnd to copy a file or folder into the container.

#### Source

The source could be a file.

```dockerfile
COPY foo.txt /root
```

Or the contents of a directory. Note - the _contents_ of the directory are copied, not the directory itself.

```dockerfile
# Similar to this in Bash: cp bar/* /root
COPY bar /root
```

Or a directory.

```dockerfile
COPY bar /root/bar
```

Or your entire project.

```dockerfile
COPY . /root
```

#### Destination

This is often copied to `/` or `/app` but `~` can work as well. Note that the user will be `root` so `sudo` is not needed and the path to `~` will be `/root`. Also my linter recommends using an absolute rather than `~`.

I'd recommend against copying to `/` since there are directories there relating to the system (similar to a system not insider a container).

### CMD / ENTRYPOINT

Finally there is usually `CMD` or `ENTRYPOINT` at the end. This will only be run when the container starts - not during the build image step.

- `CMD` sets _default_ command and/or parameters, such as starting a server or entering the Python or Bash shell. The default command can be _ignored_  if overwritten when running the container.
    ```dockerfile
    CMD echo "Hello world"
    ```
    ```dockerfile
    CMD ["/bin/bash"]
    ```
- `ENTRYPOINT` configures a container that will run as an executable. The entry point will _always_ run even if the command is overwritten.
    ```dockerfle
    ENTRYPOINT echo "Hello world"
    ```
    ```dockerfile
    ENTRYPOINT ["/bin/bash"]
    ```
        
See more info in this [post](https://goinbigdata.com/docker-run-vs-cmd-vs-entrypoint/).
