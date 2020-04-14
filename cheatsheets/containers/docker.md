# Docker cheatsheet

## Resources

- Cheatsheets
    - [Docker.com](https://www.docker.com/sites/default/files/d8/2019-09/docker-cheat-sheet.pdf).
    - [Devhints](https://devhints.io/docker).
    - [wsargent/docker-cheat-sheet](https://github.com/wsargent/docker-cheat-sheet) on _Github_.
    - [Ultimate Docker Cheatsheet](https://hackernoon.com/docker-commands-the-ultimate-cheat-sheet-994ac78e2888) as _Hackernoon_ blog post.
    - [Docker cheatsheet](http://dockerlabs.collabnix.com/docker/cheatsheet/) on Dockerlabs.
- [Docker run Reference](https://docs.docker.com/engine/reference/run/)


## Clean

Remove unused data.

```sh
$ docker system prune [OPTIONS]
```

| Options      | Description                                      |
| ------------ | ------------------------------------------------ |
| --all , -a   | Remove all unused images not just dangling ones. |
| --force , -f | Do not prompt for confirmation                   |


With no options, you will get a confirmation prompt and told that these will be removed:

- all stopped containers
- all networks not used by at least one container
- all dangling images
- all build cache

[source](https://docs.docker.com/engine/reference/commandline/system_prune/)

Remove images.

```sh
docker image prune
```
<!--stackedit_data:
eyJoaXN0b3J5IjpbNTgxNTYxMzg0XX0=
-->