# Parameters
> How to pass and use variables in a `Makefile`

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

### Pass param to make

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
