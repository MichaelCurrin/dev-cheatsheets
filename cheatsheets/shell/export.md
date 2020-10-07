---
title: Export
---

## Function

If you in ZSH, then first run `bash -l` to make sure that you define and export the function in Bash before using it in a Bash subshell.

```sh
foo () {
  echo 'Foo'
}

foo
# Foo
echo $(foo)
# Foo
```

Export and use it in a subshell:

```sh
$ export -f foo
$ bash -c foo
Foo
```

Example use-case:

```sh
$ export -f foo
$ find . -name README.md -exec bash -c 'foo $0' '{}' \;
Foo
```
