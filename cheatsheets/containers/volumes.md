---
title: Volumes
---


## Resources

- [Volumes](https://docs.docker.com/storage/volumes/) (not docker-compose specific)


## Docker compose


Mount `./foo` in same directory as docker-compose file as `/root/bar/foo`.

```
volumes:
  - "./foo:/root/bar"
```

Be sure to use `./` before a directory name, otherwise is assumed to be a named volume and given an error. If you just do `"foo" it will be mounted as `/root/foo` but empty.

You can also `~/foo` or `/foo`.

Samples from [compose file](https://docs.docker.com/compose/compose-file/) docs.


### Short syntax

- `docker-compose.yml`
  ```
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
    ```
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
