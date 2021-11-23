---
title: Prune
description: Remove unused data
---

## Related

- [Delete][] cheatsheet

[Delete]: {% link cheatsheets/containers/docker-cli/delete.md %}



## Help

```sh
$ docker system prune [OPTIONS]
```

| Options         | Description                                      |
| --------------- | ------------------------------------------------ |
| `--all`, `-a`   | Remove all unused images not just dangling ones. |
| `--force`, `-f` | Do not prompt for confirmation                   |

[source](https://docs.docker.com/engine/reference/commandline/system_prune/)


## Remove all unused - containers, networks, images, and cache

```sh
$ docker system prune
```

With no options, you will get a confirmation prompt and told that these will be removed:

- All stopped containers
- All networks not used by at least one container
- All dangling images
- All build cache


## Remove unused containers

```sh
$ docker container prune
```

Or based on docs for [rm][]. Remove stopped containers.

``` sh
$ docker rm $(docker ps --filter status=exited -q)
```

[rm]: https://docs.docker.com/engine/reference/commandline/rm/


## Remove unused images

```sh
$ docker image prune
```

Or

```sh
$ docker rmi $(docker images -a -q)
```


## Remove volumes

### Remove dangling

```sh
$ docker volume rm $(docker volume ls -qf dangling=true)
```

### Remove all volumes

Use quiet mode for `ls` to get just the volume ID.

```sh
$ docker volume rm $(docker volume ls -q)
```
