---
description: About the `command` builtin
---
# command


## Usage

### Run command

Without the flag, you actually execute the command.

So

```sh
command node
```

is the same as just

```sh
node
```

This can be useful if you want to ignore any aliases or functions an execute the original version. For example if you defined

```sh
alias mv='mv -i
```
So this will run the alias

```sh
mv ARGS
```

And this will run the original builtin.

```sh
command mv ARGS
```

This works despite the fact that `command -v mv` tells you about the alias, not the original value.

You'll get an error if it doesn't exist.

```sh
$ command unknown
zsh: command not found: unknown
```

### Get description

Add the `-v` flag, you get a description of the command.

```sh
command -v COMMAND
```

From help:

```
  -v print a description of COMMAND similar to the `type' builtin
```

It will print nothing if the command does not exist.

```sh
$ command -v unknown

```


### Find binary

```sh
$ # Package
$ command -v node
/usr/local/bin/node

$ which node
/usr/local/bin/node

$ type node
node is /usr/local/bin/node
```

### Find alias

```sh
$ command -v ll
alias ll='ls -lh'

$ which ll
ll: aliased to ls -lh

type ll
ll is an alias for ls -lh
```

## Examples

```sh
$ command -v node
/usr/local/bin/node
```

### Check if package exists

Execute logic depending on if a system package is installed.

This will hide any output and errors and use the exit status to check if the target could be found or not.

```sh
if ! command -v node >/dev/null 2>&1;
  # Install node ...
fi
```

```sh
if command -v node >/dev/null 2>&1; then
  node -v
else
  # Install node ...
fi
```
