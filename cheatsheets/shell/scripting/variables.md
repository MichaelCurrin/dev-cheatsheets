# Variables


## Assign

```sh
$ X=abc
$ X='abc'
$ X='abc def'
$ X="abc $USER"
```


## Reference

```sh
Y=$X

# Preferred esp for multi-word and multi-line values.
Y="$X" 
```

Curly braces.

```sh
Y="${X}"

# Useful to avoid `Xbar` being varible name.
Y="${X}bar"

# For positional parameters.
echo $8 $9 ${10} ${11}
```

Also useful for parameter expansion.

