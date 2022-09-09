# Networking

## Host and container connection

For host value, use:

```
host.docker.internal
```

Sometimes it doesn't work after it worked before, so you can use this assuming you have Kubernetes installed. From [comment](https://github.com/docker/for-mac/issues/2965#issuecomment-895164896).

```
kubernetes.docker.internal
```

On macOS, there is also another one you can use:

```
docker.for.mac.host.internal
```

This resolves to the internal IP address used by host for the Docker network. See the [docs](https://docs.docker.com/desktop/networking/#i-want-to-connect-from-a-container-to-a-service-on-the-host).

### Examples

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

## Ports

Publish port `80` on the container as `8000` on the host.

```sh
$ docker run -p 8000:80 --name webserver nginx
```
