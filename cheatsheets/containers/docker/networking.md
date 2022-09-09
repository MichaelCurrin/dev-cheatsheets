# Networking

## Host and container connection

For host, use `host.docker.internal`. This resolves to the internal IP address used by host for the Docker network. See the [docs](https://docs.docker.com/desktop/networking/#i-want-to-connect-from-a-container-to-a-service-on-the-host).

For example connecting to a database in a container from the command-line or a database GUI. 

```sh
$ psql DBNAME -U USER -h host.docker.internal
```

Or connecting from a container to the host.

- Host command:
    ```sh
    $ python -m http.server 8000
    ```
- Connect from inside container:
    ```sh
    $ docker run --rm -it alpine sh
    $ apk add curl
    $ curl http://host.docker.internal:8000
    ```
