---
title: Docker service
description: Handling the Docker background process
---


## Why stop and start it

Docker daemon or "dockerd" must be running before you run `docker` commands, otherwise you'll get an error that the process is not running.

You may decide to not start docker on system start or to stop when it you don't need it, in order to reduce load on the machine. Stopping it especially useful if Docker takes up a lot of memory (it takes up a few gigs of RAM on my Mac, even with zero containers running), or if you have a few containers that auto-start when Docker starts.

If you use Docker Desktop, then you should start and stop that as a desktop application. You don't have to worry about the CLI commands here.


## Manage directly

Start the daemon - note trailing `d`.

```sh
$ dockerd
INFO[2021-04-05T21:35:09.363593571+02:00] Starting up                                  
...
```
You'll see the log in the CLI. 

If you press <kbd>CTRL</kbd>+<kbd>C</kbd> then you'll stop it.

Then, in another tab, you can run `docker` commands.


## Use system manager

On Linux, you can use Systemctl/Systemd to manage Docker as a background process. Note the service here is `docker`, while internally `dockerd` will be used.

```sh
$ sudo systemctl start docker
```

```sh
$ sudo systemctl stop docker
```

Then check on it.

```sh
$ ps aux | grep docker
root      225149  0.7  1.0 1304212 83640 ?       Ssl  22:29   0:00 /usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock
```

Then you can run `docker` commands.

If you want Docker to start on system boot:

```sh
$ sudo systemctl enable docker
```
