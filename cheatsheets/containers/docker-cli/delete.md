# Delete

If you have Docker Desktop, you can also use that - see the "Clean up" section.


## Resources

- [rmi](https://docs.docker.com/engine/reference/commandline/rmi/)
- [rm](https://docs.docker.com/engine/reference/commandline/rm/)


## Delete container

```sh
$ docker rm CONTAINER_ID
```

```sh
$ docker rm CONTAINER_NAME
```

Add `-f` to force.

Add `-v` to delete volumes.

Get the ID from:

```sh
$ docker ps -a
```


## Delete image

```sh
$ docker rmi IMAGE_ID
```

e.g.

```sh
$ docker rmi python:latest
$ docker rmi fd484f19954f
```

Get the details from:

```sh
$ docker images
```


## Remove all unused data

Remove unused data.

```sh
$ docker system prune [OPTIONS]
```

| Options      | Description                                      |
| ------------ | ------------------------------------------------ |
| `--all`, `-a`   | Remove all unused images not just dangling ones. |
| `--force`, `-f` | Do not prompt for confirmation                   |

With no options, you will get a confirmation prompt and told that these will be removed:

- all stopped containers
- all networks not used by at least one container
- all dangling images
- all build cache

[source](https://docs.docker.com/engine/reference/commandline/system_prune/)


## Remove unused containers

Based on docs for [rm][].

``` sh
$ docker rm $(docker ps --filter status=exited -q)
```

[rm]: https://docs.docker.com/engine/reference/commandline/rm/


## Remove unused images

```sh
$ docker image prune
```


## Remove all volumes

```sh
$ docker volume rm $(docker volume ls -q)
```
