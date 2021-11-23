# Indefinite

Stop a container from exiting immediately - this is useful for if you need to keep it running long enough to start a terminal session in or check some other attributes.


## Tail

This command will watch continuously for output and not exit.

```sh
$ tail -f
```

Or

```sh
$ tail -f > /dev/null
```

So use that as command in `Dockerfile`:

- `Dockerfile`
    ```Dockerfile
    CMD ["tail", "-f", "/dev/null"]
    ```

Or when executing the container:

```sh
$ docker exec my-app 'tail -f /dev/null'
```


## Interactive

Or start with interactive shell.

```sh
$ docker exec -it my-app bash
```
