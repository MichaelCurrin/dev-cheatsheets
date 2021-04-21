---
logo: docker
description: Guide to synax for a `Dockerfile` file.
---
# Dockerfile

See [Dockerfile reference](https://docs.docker.com/engine/reference/builder/) doc.


## Overview

- `Dockerfile`
    ```Dockerfile
    FROM image-name

    ENV foo=bar
    ARG fizz=buzz

    RUN apt-get update
    RUN apt install -q -y foo

    RUN echo "Hello"
    ```


## Set working directory

This is useful to a working directory for subsequent commands in the image build or container running. Especially if you start in interactive mode and want to start at an appropriate directory.

If the directory does not exist, you must create it using `mkdir.

- `Dockerfile`
    ```Dockerfile
    RUN mkdir /root/foo
    WORKDIR /root/foo
    ```
- `Dockerfile`
    ```Dockerfile
    RUN mkdir /usr/src/app
    WORKDIR /usr/src/app
    ```

Though, you can set up working directory and then use `COPY` to add something there and the directory will be created, without the need for `mkdir`.

Given `app` in the current directory, the `app` directory will be copied to where the working directory expects it to be.

- `Dockerfile`
    ```Dockerfile
    WORKDIR /usr/src/app
    COPY . .
    ```

I read that using absolute paths is preferred in a container over a path like `~/foo`.


## Copy

Use the `COPY` command directories into an image.

You can copy a file or a directory.

```Dockerfile
COPY SRC DEST
```

Examples - note we leave working directory as `/root/` here so copying to relative path will use that.

<!-- TODO research and experiment to check I got these right -->

```Dockerfile
# Copy file to working directory.
COPY foo .
# cp foo /root/foo

COPY foo /root/bar/
# cp foo /root/bar/foo

COPY foo /bar/
# cp foo /bar/foo
```

```Dockerfile
# Copy files and directories
COPY . .
# cp -r . /root/

# Copy whole directory.
COPY src .
# cp -r src /root/src

# Warning.
# If the destination is a directory, the whole directory will be copied INTO the directory.
COPY src fuzz
# i.e.
# mkdir /root/fuzz
# cp -r src /root/fuzz/src
# NOT
# cp -r src /root/fuzz

# Use globstar to copy contents of directory into a new name.
COPY src/* fuzz
# i.e.
# mkdir /root/fuzz/
# cp -r src/* /root/fuzz
```

```Dockerfile
# Copy files
COPY package*.json .
# i.e.
# cp package.json /root/package.json
# cp package-lock.json /root/package-lock.json

# OR
COPY package.json package-lock.json .
```

Subdirectories will be created. For example, if `fizz` does not exist.

```Dockerfile
COPY foo /root/fizz/buzz/
```

Then that is equivalent to:

```sh
mkdir -p /root/fizz/buzz/
cp foo /root/fizz/buzz/foo
```

Using absolute destinations is preferred. So avoid using `~/bar`, though it can actually work to point to the root user's home.

You can also set the working directory in the image before your copy steps, to avoid using the prefix each time.

```Dockerfile
MKDIR /root/app
WORKDIR /root/app

COPY . .
```

Note that this works differently to the plain `cp` command - the contents of the source directory are copied, not the directory itself.

So to keep the destination as `lib`, why you would use `COPY lib lib` rather than `COPY lib .`

See also the older `ADD` command which is not used as much. It allows referencing a zip file on a URL, but the preferred way in the docs is to use `curl` and `tar` in a `RUN` command.

See [Add vs Copy](https://phoenixnap.com/kb/docker-add-vs-copy) article.

See in the docs:

- [COPY](https://docs.docker.com/engine/reference/builder/#copy)
- [ADD](https://docs.docker.com/engine/reference/builder/#add)

See also `docker cp` as a CLI command to copy a file into a container rather than using `COPY` for building the image.

Note that the source path is relative to the build context (usually the root of your repo). You **cannot** use any relative or absolute paths outside the context, such as paths like `/`, `..` or `~/`.

If you want to copy from outside the project:

```sh
$ cd ..
$ docker build -t my-app -f src/Dockerfile .
```


## Run commands

The [Run](#run) syntax to run in the shell at image build time.

See the [Command](#command) or [Entry](#entrypoint) sections for changing what a container executes.

### Run

[RUN](https://docs.docker.com/engine/reference/builder/#run) docs reference.

> The RUN instruction will execute any commands in a new layer on top of the current image and commit the results. The resulting committed image will be used for the next step in the Dockerfile.

Two forms:

- Shell form.
    ```Dockerfile
    RUN command
    ```
- Exec form.
    ```
    RUN ["executable", "param1", "param2"]
    ```

e.g.

```Dockerfile
RUN foo bar

RUN /bin/bash -c 'source $HOME/.bashrc; \
echo $HOME'
```

Note that the exec form is parsed as a JSON array, which means that you must use double-quotes (`“`) around words not single-quotes (`‘`).

```
RUN ["boo", "bar"]

RUN ["/bin/bash", "-c", "echo Hello"]

# You must use the subshell in exec form to evaluate variables.
RUN [ "sh", "-c", "echo $HOME" ]
```

### Command

See [CMD](https://docs.docker.com/engine/reference/builder/#cmd) doc reference.

The main purpose of a `CMD` is to provide defaults for an executing container.

There can only be **one** `CMD` instruction in a Dockerfile - only last is used.

The `CMD` instruction has three forms:

- Exec form - preferred.
    ```Dockerfile
    CMD ["executable", "param1", "param2"] # (exec form, this is the preferred form)
    ```
- Shell form:
    ```Dockerfile
    CMD command param1 param2
    ```

### Arguments

[ARG](https://docs.docker.com/engine/reference/builder/#arg) doc reference.

Set a build-time arg.

```sh
$ docker build --build-arg <varname>=<value>
```

```Dockerfile
ARG <name>[=<default value>]
```

Example:

```Dockerfile
FROM busybox
ARG user1
ARG buildno
# ...
```

Using `ARG` and `FROM` together, based on the docs.

```Dockerfile
ARG  CODE_VERSION=latest
FROM base:${CODE_VERSION}
CMD  /code/run-app

FROM extras:${CODE_VERSION}
CMD  /code/run-extras
```

### Entrypoint

An `ENTRYPOINT` allows you to configure a container that will run as an executable.

- Exec form - preferred.
    ```Dockerfile
    ENTRYPOINT ["executable", "param1", "param2"]
    ```
- Shell form.
    ```Dockerfile
    ENTRYPOINT command param1 param2
    ```


Set default parameters for `ENTRYPOINT`:

```Dockerfile
CMD ["param1", "param2"]
```


## Aliases

Given an image an alias and then use it later.

```Dockerfile
FROM IMAGE AS ALIAS
```

Example:

- `Dockerfile`
    ```Dockerfile
    FROM python:alpine AS base
    
    FROM base AS dev
    CMD ["mkdocs", "serve", "-a", "0.0.0.0:8000"]

    FROM base AS build
    COPY . .
    RUN mkdocs build
    ```

