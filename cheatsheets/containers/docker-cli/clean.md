# Clean

See [Manage Images][] to delete images.

See [Manage Containers][] to delete containers.

[Manage Images]: {% link cheatsheets/containers/docker-cli/manage-images.md %}
[Manage Containers]: {% link cheatsheets/containers/docker-cli/manage-containers.md %}

## Contaners

### Remove all stopped containers

```sh
docker rm $(docker ps -aq)
```

## Force remove all containers

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

Delete volumes and images

```sh
docker system prune -a --volumes
```

## Full system prune

Delete volumes and images

```sh
docker system prune -a --volumes
```
