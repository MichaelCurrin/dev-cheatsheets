---
description: How to pass and use variables in a `Makefile`
---
# Parameters


## Summary

```sh
$ FOO=1 make foo BAR=2
```

Note that `make foo BAR` will try and `make foo` and `make bar`.


## Use a variable

Here is the sample file we'll use for testing.

- `Makefile`
    ```Makefile
    foo:
      echo $(FOO)
      echo $${FOO}
    ```


## Pass a variable

Use any approach below to get the same result.

### Export environment variable

```sh
$ export FOO=bar
$ make foo
```

### Pass environment

```sh
$ FOO=bar make foo
```

### Pass known param to make

```sh
$ make foo FOO=bar
```

### Result

Here is the output printed from any of the above commands:

```
echo bar
bar
echo ${FOO}
bar
```
