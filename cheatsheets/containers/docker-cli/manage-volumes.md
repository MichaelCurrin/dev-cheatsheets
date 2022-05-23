# Manage volumes


## Related

- [Prune][] for deleting volumes.

[Prune]: {% link cheatsheets/containers/docker-cli/prune.md %}


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

Using filter:

- `-f, --filter filter` Provide filter values (e.g. 'dangling=true')
  
```sh
$ docker volume ls -qf dangling=true
```


## Remove

```sh
$ docker volume rm $(docker volume ls -q)
```
