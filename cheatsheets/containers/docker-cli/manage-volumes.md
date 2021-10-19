# Manage volumes


## Related

- [Prune][] for deleting volumes.

[Prune]: {{ site.baseurl }}{% link cheatsheets/containers/docker-cli/prune.md %}


## List

### Show all

```sh
$ docker volume ls
```

Just the IDs - using quiet.

```sh
$ docker volume ls -q
```

### Dangling volumes

```sh
$ docker volume ls -qf dangling=true
```
