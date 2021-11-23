# Functions


## Basic

```sh
foo () {
  echo 'Hello'
}
```

Or the more verbose:

```sh
function foo {
  echo 'Hello'
}
```

Call like this. No brackets.

```sh
foo
# Hello
```


## Scope

Variables are global by default. Here `X` is defined inside a function but overrides the global value.

```sh
foo () {
  X=def
  echo $X
}

X=abc

foo
# def

echo $X
# def
```

It is a good idea to make function-scoped variables local. Here the value of `X` is separate from the function-scoped value.

```sh
foo () {
  local X=def
  echo $X
}

X=abc

foo
# def

echo $X
# abc
```


## Arguments

You can't name the parameters, but you can pick them up as positional arguments like you would for the script.


```sh
foo () {
  A="$1"
  B="$2"
  echo "Count: $#"
  echo "A=$A"
  echo "B=$B"
}

foo
# Count: 0
# A=
# B=
foo abc
# Count: 1
# A=abc
# B=
foo abc def
# Count: 2
# A=abc
# B=def
```

You can also choose to exit if insufficient arguments are provided.

```sh
foo () {
  if [[ "$#" -ne 2 ]]; then
    echo "Expected 2 arguments, got: $#"
    exit 1
  fi
}

foo
# Expected 2 arguments, got: 0
```


## Capture

### Return values

Use `echo` to return a value and then use a subshell to store the value.

```sh
foo () {
  local BAR=abc
  echo "$BAR"
}

FIZZ=$(foo)
echo $FIZZ
# abc
```

### Return status

Use the `return` built-in to return a number as the exit status for a function, without exiting the script.

See [return][] command for using `return` inside a function.

[return]: {% link cheatsheets/shell/commands/return.md %}

Example for conditional exiting:

```sh
foo () {
  local BAR="$1"

  if [[ -z "$BAR" ]]; then
    echo "Argument to foo is missing"

    return 1
  fi

  # Do more here...
}

foo
# Argument to foo is missing
echo $?
# 1
```
