---
title: Install
description: How to install Docker and related tools
---

## Quick reference

See this guide in the Docker docs and choose your OS:

- [Download and install Docker](https://docs.docker.com/get-started/#download-and-install-docker)

Or continue to either the [Docker Desktop](#docker-desktop) or [Docker Engine](#docker-engine) instructions below.


## Docker Desktop

**Windows** and **macOS** only. For Linux, see [Docker Engine](#docker-engine) below.

Recommended - install the Docker Desktop app. It also covers Docker CLI, so you don't have to install that separately.

Installing the app sets up a desktop app which handles updates and shortcut on the taskbar for quick access to a few things. Including switching between Kubernetes namespaces (like prod and dev).

> Docker Desktop includes Docker Engine, Docker CLI client, Docker Compose, Notary, Kubernetes, and Credential Helper.

For info and links to download and install, see:

- [Docker Desktop](https://docs.docker.com/desktop/) docs

### macOS

Go to this page:

- [Install Docker Desktop on Mac](https://docs.docker.com/docker-for-mac/install/)

There is a file to download from the browser. Drag the downloaded `Docker.app` to your _Applications_ as per the install instuctions and you'll get Docker app.

This install includes both Docker CLI and the Docker Desktop app. The latter docks as an icon at the top of the screen and allows functionality like signing into Docker hub, changing Kubernetes environment.


## Docker Engine

Windows, macOS and Linux.

Documentation:

- [Docker Engine](https://docs.docker.com/engine/) docs.
- [Install Docker Engine](https://docs.docker.com/engine/install/) docs.

### Linux

- [Ubuntu install guide](https://docs.docker.com/engine/install/ubuntu/)
- [Debian install guide](https://docs.docker.com/engine/install/debian/) 

Below are instructions from the Debian install guide.

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

Verify that Docker works by using:

```sh
$ sudo docker run hello-world
```

