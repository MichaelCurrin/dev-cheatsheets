# Setup


## Install

```sh
brew install podman
```
```sh
sudo apt install podman
```


## Initialize

```sh
podman machine init
```

If you get this error:

```
Error: exec: "qemu-system-x86_64": executable file not found in $PATH
```

Run:

```sh
sudo apt install qemu-system-x86
```

Based on [thread](https://github.com/containers/podman/issues/12775).

## Use as Docker drop-in replacement

Set in your shell config like this based on the CLI output.

```sh
export DOCKER_HOST='unix:///var/folders/.../.../.../podman/podman-machine-default-api.sock'
```
