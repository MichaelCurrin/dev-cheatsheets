# Manage images


## List

List images.

```sh
$ docker image ls
```

Or

```sh
$ docker images
```

Filter by name.

```sh
$ docker image ls my-app
```


## Build

Create a container from an image.

Give the image a name with `-t` flag. If you don't do this, then a random name will be used and then it is harder to use `docker run` as you then have to lookup a name.

```sh
$ docker build -t my-app .
```

Ignore cache.

```sh
$ docker build -t my-app . --no-cache 
```


## Pull

Download an Docker image from a container registry. See [docs](https://docs.docker.com/engine/reference/commandline/image_pull/).

```sh
$ docker image pull REFERENCE
```

Get the `latest` image:

```sh
$ docker image pull foo/bar
```

Get a named image such as with a release tag or branch name.

```sh
$ docker image pull foo.com/bar@v1.2.3
$ docker image pull ubuntu@lunar
$ docker image pull ubuntu@23.04
```

Use `--all-tags` or `-a` to download all tags in the image repository.

To use an image directly with an unnamed container:

```sh
$ docker image pull ubuntu
$ docker run ubuntu
```

Or use the name in Dockerfile like `IMAGE ubuntu`.
