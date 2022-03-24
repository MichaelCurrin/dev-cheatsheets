---
title: Install
description: How to install Docker and related tools
---

## Resources

See one of these in the Docker docs and choose your OS there:

- [Get Docker](https://docs.docker.com/get-docker/)
- [Orientation and setup - Download and install Docker](https://docs.docker.com/get-started/#download-and-install-docker)

Or continue to either the [Docker Desktop](#docker-desktop) or [Docker Engine](#docker-engine) instructions below.


## Install Docker Desktop

**Windows** and **macOS** only. For Linux, see [Docker Engine](#docker-engine) below.

Recommended - install the Docker Desktop app. This also covers Docker CLI, so you don't have to install that separately.

Warning - please see the license details as this can be used for personal projects fine but needs a paid license if used in your org.

For info and links to download and install, see:

- [Docker Desktop](https://docs.docker.com/desktop/) docs

> Docker Desktop helps you build, share, and run containers easily on Mac and Windows as you do on Linux. Docker handles the complex setup and allows you to focus on writing the code

### What you get

Installing the app sets up a desktop app which handles updates and shortcut on the taskbar for quick access to a few things. Including switching between Kubernetes namespaces (like prod and dev).

> Docker Desktop includes Docker Engine, Docker CLI client, Docker Compose, Notary, Kubernetes, and Credential Helper.

### Install on your OS

Linux solution is in development still.

#### macOS

Go to this page:

- [Install Docker Desktop on Mac](https://docs.docker.com/docker-for-mac/install/)

There is a file to download from the browser. Drag the downloaded `Docker.app` to your _Applications_ as per the install instructions and you'll get Docker app.

This install includes both Docker CLI and the Docker Desktop app. The latter docks as an icon at the top of the screen and allows functionality like signing into Docker hub, changing Kubernetes environment.

### Windows

Go to this page:

- [Install Docker Desktop on Windows](https://docs.docker.com/desktop/windows/install/)


## Install Docker Engine

### What you get

This allows you to run Docker CLI and the Docker daemon (which needs to be started to get containers to run and the CLI interfaces with this daemon).

> - A server with a long-running daemon process dockerd.
> - APIs which specify interfaces that programs can use to talk to and instruct the Docker daemon.
> - A command line interface (CLI) client docker.

### Documentation

- [Docker Engine](https://docs.docker.com/engine/) docs.
- [Install Docker Engine](https://docs.docker.com/engine/install/) docs.

### Install on your OS

Windows, macOS and Linux.

I can't see instructions for Windows and macOS though - just the desktop instructions.

### macOS

- [docker](https://formulae.brew.sh/formula/docker) Brew formula
- [docker-compose](https://formulae.brew.sh/formula/docker-compose#default)

```sh
$ brew install docker
$ brew install docker-compose
```

> Compose is now a Docker plugin. For Docker to find this plugin, symlink it:
>
> ```sh
> $ mkdir -p ~/.docker/cli-plugins
> $ ln -sfn $(brew --prefix)/opt/docker-compose/bin/docker-compose ~/.docker/cli-plugins/docker-compose
> ```

You might need to install and run `docker-machine` too as per [article](https://medium.com/crowdbotics/a-complete-one-by-one-guide-to-install-docker-on-your-mac-os-using-homebrew-e818eb4cfc3).

```sh
$ brew install docker-machine
```

#### Linux

- [Ubuntu install guide](https://docs.docker.com/engine/install/ubuntu/)
- [Debian install guide](https://docs.docker.com/engine/install/debian/)

Below are instructions from the Debian install guide. See [Docker Compose install][] cheatsheet if you want to install that too.

1. Remove old Docker packages in case they exist.
    ```sh
    sudo apt-get remove docker docker-engine docker.io containerd runc
    ```
2. Install the newer packages.
    ```sh
    $ sudo apt-get update
    $ sudo apt-get install docker-ce docker-ce-cli containerd.io
    ```

For Linux Lite, those packages not available, so use:

```sh
$ sudo apt-get install docker.io
```

That will install `bridge-utils`, `containerd`, `runc` and `ubuntu-fan`.

Check your version:

```console
$ sudo docker -v
Docker version 20.10.7, build 20.10.7-0ubuntu5~20.04.2
```

Verify that Docker works by using:

```sh
$ sudo docker run hello-world
```

If you want to run without `sudo` but get an error on permissions, then set this:

```sh
$ sudo chown $USER /var/run/docker.sock
```

Check docker:

```console
$ docker -v
Docker version 20.10.7, build 20.10.7-0ubuntu5~20.04.2
```

[Docker Compose install]: {% link cheatsheets/containers/docker-compose/install.md %}
