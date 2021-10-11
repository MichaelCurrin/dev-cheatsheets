# Delete

If you have Docker Desktop, you can also use that - see the "Clean up" section.


## Resources

- [rm](https://docs.docker.com/engine/reference/commandline/rm/)
- [rmi](https://docs.docker.com/engine/reference/commandline/rmi/)


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


