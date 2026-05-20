# Clean

See [Manage Images][] to delete images.

See [Manage Containers][] to delete containers.

[Manage Images]: {% link cheatsheets/containers/docker-cli/manage-images.md %}
[Manage Containers]: {% link cheatsheets/containers/docker-cli/manage-containers.md %}

## Containers

### Remove all stopped containers

```sh
docker rm $(docker ps -aq)
```

### Force remove all containers

```sh
docker rm -f $(docker ps -aq)
```

## Images

## Remove all dangling images

Dangling images are layers no longer tagged or referenced by any container.
```sh
docker image prune
```

## Remove all unused images

Unused images are simply those not currently associated with a running or stopped container.

```sh
docker rmi $(docker images -q)
```

## Full system prune

Deletes stopped containers, unused networks, dangling images (images without a tag), and build caches.

```sh
docker system prune -a --volumes
```

Add `-f` to force.

## Delete build cache

Deletes all build cache, not just the unused parts, forcing Docker to rebuild every layer from scratch next time.

```sh
docker builder prune -a -f:
```
