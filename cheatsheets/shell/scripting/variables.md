# Variables


## Related

- [Strings][] cheatsheet for substituting values in strings.

[Strings]: {% link cheatsheets/shell/scripting/strings.md %}


## Assign

```sh
$ X=abc
$ X='abc'
$ X='abc def'
$ X="abc $USER"
```


## Reference

### Basic

```sh
Y=$X

# Preferred esp for multi-word and multi-line values.
Y="$X"
```

### Curly braces

```sh
Y="${X}"
```

This can be useful to stop the variable name from being evaulated correctly or looking confusing.

```sh
# Compare with "$Xbar" which would reference Xbar variable unexpectedly.
Y="${X}bar"

# Compare with "$X_Z" which would reference X_Z variable unexpectedly.
Y="${X}_Z"
```

It can be used for positional parameters.

```sh
echo $8 $9 ${10} ${11}
```

Also useful for parameter expansion for more advanced use as in the linked strings cheatsheet.
