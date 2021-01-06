# Volumes


## Resources

- [Volumes](https://docs.docker.com/storage/volumes/)


## Using Docker CLI

### Mount

Using the `--mount` flag.

This is more verbose preferred, according to the docs.

e.g.

```sh
$ docker run -d \
  --name devtest \
  --mount source=myvol2,target=/app \
  nginx:latest
```

### Volume

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


## Using Docker compose

Mount `./foo` in same directory as docker-compose file as `/root/bar/foo`.

```yaml
volumes:
  - "./foo:/root/bar"
```

Be sure to use `./` before a directory name, otherwise is assumed to be a named volume and given an error. If you just do `"foo"` it will be mounted as `/root/foo` but empty.

You can also `~/foo` or `/foo`.

Samples from [compose file](https://docs.docker.com/compose/compose-file/) docs.

### Short syntax

- `docker-compose.yml`
  ```yaml
  volumes:
  # Just specify a path and let the Engine create a volume
  - /var/lib/mysql

  # Specify an absolute path mapping
  - /opt/data:/var/lib/mysql

  # Path on the host, relative to the Compose file
  - ./cache:/tmp/cache

  # User-relative path
  - ~/configs:/etc/configs/:ro

  # Named volume
  - datavolume:/var/lib/mysql
  ```

### Named volumes

- `docker-compose.yml`
    ```yaml
    version: "3.8"

    services:
      web:
        image: nginx:alpine
        volumes:
          - type: volume
            source: mydata
            target: /data
            volume:
              nocopy: true
          - type: bind
            source: ./static
            target: /opt/app/static

      db:
        image: postgres:latest
        volumes:
          - "/var/run/postgres/postgres.sock:/var/run/postgres/postgres.sock"
          - "dbdata:/var/lib/postgresql/data"

    volumes:
      mydata:
      dbdata:
    ```
