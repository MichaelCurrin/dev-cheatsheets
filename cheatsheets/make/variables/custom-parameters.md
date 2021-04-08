---
title: Custom parameters
description: How to pass variables to the `make` command in the shell and use them in the `Makefile`.
---


## Summary

You can pass variables to your `Makefile` using environment variables or using key-value pairs. Or a mix of both.

Values below available in `Makefile`. Note case sensitivity - pass as `bar=1` if you want to use as `bar`.

```sh
$ BAR=1 make foo
```

```sh
$ export BAR=1 
$ make foo
```

```sh
$ make foo BAR=abc
```


## Use a variable

Here is the sample file we'll use for testing in the section sections

- `Makefile`
    ```Makefile
    foo:
        @echo $(FOO)            # Make variable.
        @echo $${FOO}           # Shell variable.
        @bash -c 'echo "$$FOO"' # Subshell.
    ```

Note that `FOO` will be available for commands, **without** having to export it like this:

- `Makefile`
    ```Makefile
    export FOO

    foo:
        # ...
    ```


## Pass a variable

Use any approach below to get the same result.

### Export environment variable

```sh
$ export FOO=bar
$ make foo
```

```
bar
bar
bar
```

### Passas  environment variable

```sh
$ FOO=bar make foo
```

```
bar
bar
bar
```

### Pass as keyword parameter

```sh
$ make foo FOO=bar
$ # OR
$ make FOO=bar foo
```

```
bar
bar
bar
```

## Rename variable

See also the Definition page setting a default value for an input variable.

Perhaps you want to pass a variable name with a short name or different case on the shell, then use it under another name in the `Makefile`.

Here we rename a variable from `v` to `VERSION` using shell evaluation.

- `Makefile`
    ```sh
    VERSION := $(v)

    show-vsn:
        @echo "Target version: $(VERSION)"
    ```

Example use:

```sh
$ export v=1.2.3
$ make show-version
Target version: 1.2.3
```


## Note on syntax

Note you have to do keyword options.

Any arguments for `make` as targets to run.

This will as `BAR=1` as a variable in `Makefile`.

```sh
$ make foo BAR=1
```

This will run `make foo` and `make BAZZ` and fail:

```sh
$ make foo BAR
```
