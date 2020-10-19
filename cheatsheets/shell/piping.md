# Piping

Sending input to another command.


Send literal output of a file listing command to another.

```sh
find . -type f | wc -l
```

Send the file list to the command.

```sh
wc -l $(find . -type f)
```

Chain more tools

```sh
head $(find . -type f ) | less
```
