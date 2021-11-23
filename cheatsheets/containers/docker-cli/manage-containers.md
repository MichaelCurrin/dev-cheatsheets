# Manage containers

See also the [Run containers][] cheatsheet.

[Run containers]: {% link cheatsheets/containers/docker-cli/run-containers.md %}


## List

- Show all running containers.
    ```sh
    $ docker ps
    ```
- Show running and stopped containers with `--all` flag or alias.
  ```sh
  $ docker ps -a
  ```
- Show a specific container
    ```sh
    $ docker ps -a \
        --filter "name=my-app"
    ```


## View

- Check Linux version.
    ```sh
    $ docker run node:12-slim \
        cat /etc/issue
    ```

- See containers logs (recommended).
    ```sh
    $ docker logs -f my-app
    ```


## Stop and remove container

Stop a running container.

```sh
$ docker stop my-app
```

Stop **all** running containers. This uses `--quiet` flag return only the container IDs.

```sh
$ docker stop $(docker ps -q)
```

Remove a stopped container.

```sh
$ docker rm my-app
```
