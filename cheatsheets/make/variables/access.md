## Access

### Make variable

Use as a Make variable:

- `Makefile`
    ```Makefile
    FOO = a
    BAR = 1

    test:
        echo "$(FOO) $(BAR)"
    ```

```sh
$ make test
echo "a 1"
a 1
```

The quotes are not strictly needed.

Note that if you use single quotes, the variables will _still_ be evaluated.

### Shell variable

Or use it as a Shell variable. NB. The `$` must be escaped as `$$`.

```Makefile
FOO = a
BAR = 1

test:
    echo "$(FOO) $(BAR)"
```
