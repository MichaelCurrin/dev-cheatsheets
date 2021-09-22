# Clean


## Prune

```sh
$ docker system prune
```

This will remove:

- all stopped containers
- all networks not used by at least one container
- all dangling images
- all dangling build cache


Help:

```
Usage:  docker system prune [OPTIONS]

Remove unused data

Options:
  -a, --all             Remove all unused images not just dangling ones
      --filter filter   Provide filter values (e.g. 'label=<key>=<value>')
  -f, --force           Do not prompt for confirmation
      --volumes         Prune volumes
```
