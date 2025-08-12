# CLI

## Install

```sh
brew install podman
```
```sh
podman machine init
```

```sh
podman machine start
```

```sh
podman machine stop
```

## Run

Remember - if you are using Podman as a drop-in replacement for Docker, you can use `docker` commands instead of these.

### Registry

```sh
podman login REGISTRY
```

### Images
```sh
podman pull xxx/yyy:latest
```

### Containers

```sh
podman run -it -p 8080:8080
```

If you configure `DOCKER_HOST` you can run Docker CLI commands without referecing podman.
