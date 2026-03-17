# Setup


## Install

```sh
brew install podman
```
```sh
sudo apt install podman
```

On Windows you can download the installer from the [Downloads](https://podman-desktop.io/downloads) page for Podman Desktop.

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


## Manage the process

```sh
podman machine start
```

```sh
podman machine stop
```

## Use as Docker drop-in replacement

Set in your shell config like this based on the CLI output.

```sh
export DOCKER_HOST='unix:///var/folders/.../.../.../podman/podman-machine-default-api.sock'
```

In PowerShell:

```sh
Set-Alias -Name docker -Value podman
```
