# Upgrade


## Help

```sh
$ gem help update
```
```
Usage: gem update GEMNAME [GEMNAME ...] [options]

  Options:
      --system                     Update the RubyGems system software
```


## Update a target gem

```sh
$ gem update GEMNAME
```

## Update all gems

```sh
$ gem update
```

## Update the RubyGems gem only

```sh
$ gem update --system
```

From the help:

```
--system [VERSION]           Update the RubyGems system software
```

You might want to use more control with `sudo` or `--user-install`.
