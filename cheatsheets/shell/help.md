# Help

How to see help for a command.

## Summary

```sh
# Bash
help COMMAND
# ZSH
run-help COMMAND
```

```sh
man COMMAND
```

```sh
info COMMAND
```

Those might not be available for NPM or Python CLI tools, so try this:

You can usually also do at least one of these:

```sh
COMMAND --help
COMMAND -h
COMMAND help
```

Sometimes `-h` is marked as deprecated or even does not work. If it does work, it sometimes gives short output while `--help` gives long output.

## Pipe

Help output might print out completely. So if you want to make it easier to scroll through and search, you can use it with `less`.

```sh
COMMAND --help | less
```


## Man

OS shell tools come with manual pages.

```sh
$ man COMMAND
```

You can view it in your IDE.

```sg
man ls | sublime
```
