# Volumes

## Bind mounts vs Named volumes

In Docker Compose, a small change in syntax completely changes where your data is stored.

### Bind Mounts (Local Folders)

Managed in the repo.

```yaml
volumes:
  - ./foo:/root/bar/foo
```

As `./foo` (not dotslash is needed) or `~/foo` or `/foo`.

###  Named volumes

Managed by Docker. Persists if you delete the repo.

If you omit the `./`, Docker assumes you are referencing a **Named Volume**.

```yaml
services:
  foo:
    volumes:
      - foo:/root/bar/foo

volumes:
  - foo
```

### Summary

| Feature | Named Volume | Bind Mount |
| :--- | :--- | :--- |
| **Location** | Managed by Docker | Your project folder (`./data`) |
| **Performance** | Native speed | Slower (especially on Mac/Win) |
| **Ease of Use** | Set it and forget it | Can have permission issues |
| **Best For** | Production, Databases | Config files, Source code |



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


Another example, from the Docker Compose file [specification](https://docs.docker.com/compose/compose-file/).

- `docker-compose.yml`
    ```yaml
    services:
      backend:
        image: awesome/backend
        
        volumes:
          - type: volume
            source: db-data
            target: /data
            volume:
              nocopy: true
              
          - type: bind
            source: /var/run/postgres/postgres.sock
            target: /var/run/postgres/postgres.sock

    volumes:
      db-data:
    ```
