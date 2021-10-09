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

No name. This can hard to use then when `docker run`.

```sh
$ docker build .
```

Give the image a name.

```sh
$ docker build -t my-app .
```

Ignore cache.


```sh
$ docker build -t my-app . --no-cache 
```
