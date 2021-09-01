# Manage volumes


## Show all

```sh
$ docker volume ls -q
```


## Delete all

Use quiet mode for `ls` to get just the volume ID.

```sh
$ docker volume rm $(docker volume ls -q)
```
