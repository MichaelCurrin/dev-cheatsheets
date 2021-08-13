# Docstring


## Format


```sh
# FUNCTION_NAME ARG1 ARG2
# -----------------------
# MY_DESCRIPTION
# ...
# ...
FUNCTION_NAME () {
  MY_LOGIC
}
```

## Example

See [configure](https://github.com/python/cpython/blob/main/configure) in CPython repo.

```sh
# as_fn_executable_p FILE
# -----------------------
# Test if FILE is an executable regular file.
as_fn_executable_p ()
{
  test -f "$1" && test -x "$1"
} # as_fn_executable_p
```
