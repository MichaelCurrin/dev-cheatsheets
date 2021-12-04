
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

