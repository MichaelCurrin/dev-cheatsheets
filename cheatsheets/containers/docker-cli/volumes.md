# Volumes


## Mount

Using the `--mount` flag.

This is more verbose preferred, according to the docs.

e.g.

```sh
$ docker run -d \
  --name devtest \
  --mount source=myvol2,target=/app \
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

```
--volume=FROM:TO
```

```
--volume=./src:/usr/lib/src
--volume=$PWD:/app
```

You can't use `.` for from as you'll get an error that is must be at least two characters.

e.g.

```sh
$ docker run --rm \
  -p 4000:4000
  --volume "$PWD:/srv/jekyll" \
  -it jekyll/jekyll:$JEKYLL_VERSION \
  jekyll build --trace
```

