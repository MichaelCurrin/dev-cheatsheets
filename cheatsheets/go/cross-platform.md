---
title: Compile cross platform
description: How to compile for different operating systems
---

Use `go build` and some environment flags.


## Example

Build a 32-bit Linux binary with target name.

```sh
$ GOOS=linux GOARCH=386 go build -o linux_386_build
```


## Options

From [Environment](https://golang.org/doc/install/source#environment) section of Go docs.

### Host OS

The host's operating system name.

- Variable name: `$GOHOSTOS`.
- e.g. `linux`

### Host architecture

- Variable name: `$GOHOSTARCH`.
- e.g. `amd64`

### Target OS 

- Name of the target operating system
- Variable name: `$GOOS`
- Defaults to value of `$GOHOSTOS`
- Some sample allowed choices:
    - `amd64` (64-bit x86, the most mature port)
    - `386` (32-bit x86)
    - `arm` (32-bit ARM)
    - `arm64` (64-bit ARM)

### Target architecture

- Name of the compilation architecture. 
- Variable name: `$GOARCH`.
- Defaults to value of `$GOHOSTARCH`.
- Some sample allowed choices:
    - `darwin`
    - `linux`
    - `windows`
    - `android`
    - `ios`
