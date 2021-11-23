# Volumes


## Mount

Here we have directory in the repo at root as `foo`.
This is mounted in the container as `/root/bar/foo`.

```yaml
volumes:
  - "./foo:/root/bar"
```

### Relative paths

Be sure to use dotslash before a directory name.

```
./foo
```

Note that setting directory as:

```
foo
```

That will be assumed to be a _named volume_.

It will expand to be this path on your host. Which will probably not exist and will give an error.

```
/root/foo
```

### Relative paths

- `~/foo`
- `/foo`


## Examples

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
