# Setup


## Install

```sh
brew install podman
```
```sh
podman machine init
```

## Use as Docker drop-in replacement

Set in your shell config like this based on the CLI output.

```sh
export DOCKER_HOST='unix:///var/folders/.../.../.../podman/podman-machine-default-api.sock'
```
