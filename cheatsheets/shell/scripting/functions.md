# Functions


## Capture function output

```sh
foo () {
  local BAR=abc
  echo "$BAR"
}

fizz=$(foo)
echo $fizz
# abc
```
