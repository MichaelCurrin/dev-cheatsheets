# Clean

Remove unused data.

```sh
$ docker system prune [OPTIONS]
```

| Options      | Description                                      |
| ------------ | ------------------------------------------------ |
| `--all`, `-a`   | Remove all unused images not just dangling ones. |
| `--force`, `-f` | Do not prompt for confirmation                   |


With no options, you will get a confirmation prompt and told that these will be removed:

- all stopped containers
- all networks not used by at least one container
- all dangling images
- all build cache

[source](https://docs.docker.com/engine/reference/commandline/system_prune/)

Remove images:

```sh
$ docker image prune
```
