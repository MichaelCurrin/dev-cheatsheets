# Install

Compose is now a Docker plugin, accessed as a subcommand as `docker compose` and not `docker-compose` (to be deprecated).

## macOS

- [docker-compose](https://formulae.brew.sh/formula/docker-compose#default)

```sh
$ brew install docker-compose
```

For Docker to find this plugin, symlink it:

```sh
$ mkdir -p ~/.docker/cli-plugins
$ ln -sfn $(brew --prefix)/opt/docker-compose/bin/docker-compose ~/.docker/cli-plugins/docker-compose
```


## Linux

On Linux, you need to install this as a separate plugin.

Steps based on [Digital Ocean tutorial](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-ubuntu-20-04).

Pick a release number from [releases](https://github.com/docker/compose/releases). e.g. `2.2.3`.

```sh
$ mkdir -p ~/.docker/cli-plugins/
```

Download the plugin:

```sh
$ VSN=2.2.3
$ curl -SL \
    https://github.com/docker/compose/releases/download/v$VSN/docker-compose-linux-x86_64 \
    -o ~/.docker/cli-plugins/docker-compose
```

Set permissions:

```sh
$ chmod +x ~/.docker/cli-plugins/docker-compose
```

Test docker compose command.

```console
$ docker compose version
Docker Compose version v2.3.3
```
