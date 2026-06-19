---
title: Buildkit

---

## What it is

BuildKit is the default builder for Docker Desktop and Docker Engine as of version 23.0, providing enhanced performance and new features for building images.

See the [Buildkit Docker documentation](https://docs.docker.com/build/buildkit/) including the benefits.


## Setup

### Install

Note: This works whether you use Docker or an alternative like Colima or Podman.

See [Installing](https://github.com/docker/buildx#installing) on the GitHub repo.

```sh
brew install docker-buildx
```

### Configure

Edit `~/.docker/config.json` and add this:

```json
{
  "cliPluginsExtraDirs": [
    "/opt/homebrew/lib/docker/cli-plugins"
  ]
}
```

The default should be on but you can set it as on with `1` or off as `0` like this:

```sh
export DOCKER_BUILDKIT=1
```
