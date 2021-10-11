---
title: Prune
description: Remove unused data
---

## Related

- [Delete][] cheatsheet

[Delete]: {{ site.baseurl }}{% link cheatsheets/containers/docker-cli/delete.md %}



## Help

```sh
$ docker system prune [OPTIONS]
```

| Options      | Description                                      |
| ------------ | ------------------------------------------------ |
| `--all`, `-a`   | Remove all unused images not just dangling ones. |
| `--force`, `-f` | Do not prompt for confirmation                   |

[source](https://docs.docker.com/engine/reference/commandline/system_prune/)


## Remove all

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


## Remove all volumes

```sh
$ docker volume rm $(docker volume ls -q)
```
