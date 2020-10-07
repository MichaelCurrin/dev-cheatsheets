---
title: Unset
---


## Define

```sh
x=foo
```

## Remove

Set to empty string.

```sh
x=''
```

Unset - remove from variables.

```sh
unset x
```

When doing `echo $x`, you won't see a difference as in both cases it will render as empty string.


## Check

From [answer](https://stackoverflow.com/questions/3601515/how-to-check-if-a-variable-is-set-in-bash?page=1&tab=votes#tab-top)

Check a variable is set:

```sh
[ -z ${var+foo} ]
```

Check if a variable is an empty string or not set - it can't distinguish.

```sh
[ -z $foo ]
```
