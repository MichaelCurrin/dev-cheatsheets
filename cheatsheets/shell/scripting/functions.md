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


## Return status

See [return][] command for using `return` inside a function.

[return]: {{ site.baseurl }}{% link cheatsheets/shell/commands/return.md %}

Example for conditional exiting.
```sh
foo () {
  BAR="$1"
  
  if [[ -z "$BAR" ]]; then
    echo "Argument to foo is missing"
    
    return 1
  fi
  
  # do more here...
}

foo
```

```console
$ bash foo.sh
Argument to foo is missing
```
