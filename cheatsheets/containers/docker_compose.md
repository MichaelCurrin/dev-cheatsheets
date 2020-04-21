# Docker compose cheatsheet

- [Docker compose reference docs](https://docs.docker.com/compose/reference/overview/)

## Build

### Initial build

Build images.

```sh
docker-compose build
```

Start containers. If the above step was skipped, the build will happen down

```sh
docker-compose up
```

Stop it with <kbd>ctrl+C</kbd>

Start containers again. This will **not** rebuild the image.

```sh
docker-compose up
```

### Rebuild

Add the latest code to the image by forcing a build.

```sh
docker-compose build
docker-compose up  # This alone will not build.
```

Or, in one command.

```sh
docker-compose up --build
```
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTE5ODkyNzA1NTldfQ==
-->