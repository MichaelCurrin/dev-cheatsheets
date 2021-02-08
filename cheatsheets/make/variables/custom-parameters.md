---
title: Custom parameters
description: How to pass and use variables with the `make` command
---


## Summary

You can pass variables to your `Makefile` using environment variables or using key-value pairs. Or a mix of both.

```sh
$ BAR=1 make foo
$ make foo BAZZ=abc
```

Values are available in `Makefile` as `BAR` and `BAZZ`.

Note case sensitivity - pass as `bar=1` if you want to use as `bar`.


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

```mk
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

### Pass environment variable

```sh
$ FOO=bar make foo
```

```
bar
bar
bar
```

### Pass as command option

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
