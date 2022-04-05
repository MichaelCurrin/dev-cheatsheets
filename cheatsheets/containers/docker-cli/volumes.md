# Volumes

Use the more verbose mount approach or the more succinct volume approach.

- [Volumes](https://docs.docker.com/storage/volumes/) in the Docker docs.

> If you start a container with a volume that does not yet exist, Docker creates the volume for 


## Mount vs Volume

From the docs. Both approaches here give the same results.

Using the `--mount` flag.

```sh
$ docker run \
  --name devtest \
  --mount source=myvol2,target=/app \
  nginx:latest
```

Using the `--volume` flag.

```sh
$ docker run \
  --name devtest \
  -v myvol2:/app \
  nginx:latest
```


## Volume

Using the `--volume` flag.

```sh
$ docker run --help
...
  -v, --volume list                    Bind mount a volume
...
```

Set the _from_ path on the host and the _to_ path in the container.

```
--volume=FROM:TO
```

```
--volume=./src:/usr/lib/src
--volume=$PWD:/app
```

You can't use `.` for _from_ as you'll get an error that is must be at least two characters. So you the working directory with `$PWD`.

e.g.

```sh
$ docker run \
  -it \
  --rm \
  -p 4000:4000
  --volume "$PWD:/srv/jekyll" \
  jekyll/jekyll:$JEKYLL_VERSION \
  jekyll build --trace
```
