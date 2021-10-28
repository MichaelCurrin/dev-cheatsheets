---
title: Control flow
description: Conditionals in shell scripting
---

See the [Conditionals][] section for syntax of expressions in a test.

[Conditionals]: {% link cheatsheets/shell/scripting/conditionals.md %}


## Basic

### Built-in commands

```sh
$ true
$ false
```

### Chain

Use check in a chain.

```sh
$ true && echo 'True!' || echo 'False!'
True!
```

```sh
$ [[ -n "$FOO" ]] && echo 'FOO is set'
```

### If else

Use with `if`.

```sh
if true; then
  echo 'True!'
fi
# True!
```

Use with `if` and `else`.

```sh
if true; then
  echo 'True!'
else
  echo 'False!'
fi
# True!
```

### Negate

```sh
if ! false; then
  echo 'Yes!'
fi
```

```sh
if [[ ! "$x" == 'abc' ]]; then
  echo 'Yes!'
fi
```

```sh
if [[ "$x" != 'abc' ]]; then
  echo 'Yes!'
fi
```

### Case

Repeat for as many cases as you like. Recommended - put in `*` to handle no match.

```sh
case VALUE in
  CASE_1)
    # Action for case 1
    ;;
  CASE2 )
    # Action for case 2
    ;;
  *)
    # Action for no match.
    ;;
esac
```

e.g.

```sh
FOO=def

case "$FOO" in
  abc)
    echo 'Matched abc'
    ;;
  def)
    echo 'Matched def'
    ;;
  *)
    echo 'No match'
    ;;
esac
```

Result:

```
Matched def
```


## AND OR

### AND

```sh
[[ EXPRESSION ]] && [[ EXPRESSION ]]
```

That is preferred to:

```sh
[[ EXPRESSION && EXPRESSION ]]
```

### OR

```sh
[[ EXPRESSION ]] || [[ EXPRESSION ]]
```


## Expressions

### Match string

Replace `true` or `false` above with an expression.

Text check

```sh
x='abc'

if [[ "$x" == 'abc' ]]; then
  echo 'Yes!'
fi
# Yes!
```

### Check numeric condition

```sh
AGE=20

if [[ "$AGE" -ge 18 ]]; then
  echo 'Major!'
fi
# Major!
```

### Check maths condition

Use double brackets `$((CALC))` to evaluate a mathematical expression.

```sh
[[ "$(($a))" -eq "$(($b))" ]]
```

OR

```sh
[[ "$((a == b))" -ne 0 ]]
```

### Pattern matching

Use single or double equals sign - the same in newer shells.

```sh
[[ VARIABLE == VALUE ]]
```

e.g.

```sh
[[ "$NAME" == "Joe" ]]
```

#### Contains

A more specific case of pattern matching.

```sh
[[ VARIABLE = *NEEDLE* ]]
```

Note lack of quotes so that `*` gets expanded for the check. In this case `*` does not have to do with paths like it usually does.

e.g.

```sh
GREETING='Hello, world'

[[ "$GREETING" = *lo* ]] && echo 'Match' || echo 'No match'
Match
```

Check if a string is in your OS type.

```sh
[[ "$OSTYPE" = *darwin* ]] && echo 'I'm a mac' || echo 'I'm not a mac'
```

### Regex

```sh
[[ VARIABLE =~ CONDITION ]]
```

e.g.

```sh
FIRST=abc
SECOND=def

[[ "$FIRST" =~ '^d' ]] && echo 'Match' || echo 'No match'
# No match
[[ "$SECOND" =~ '^d' ]] && echo 'Match' || echo 'No match'
# Match
```


## Test command syntax vs hard bracket syntax

Note the older format of the `test` command:

```sh
test EXPRESSION
```

That is mostly replaced by:

```sh
[ EXPRESSION ]
```

And in some shell flavors such as Bash and ZSH, you can use double brackets which adds some extra functionality you might want.

```sh
[[ CONDITION ]]
```

But note that `dash` (on Ubuntu) is similar to Bash does **not** support double brackets. Why does this matter? if you use `sh` command on Ubuntu, you'll end up running `dash` and **not** `bash` and so will get a syntax error on double brackets.


## Ignore

```sh
CMD || true
```

Optionally hide output.

```sh
CMD > /dev/null || true
```

Or just

```sh
set -e

# ...

set +e
CMD
set -e
```


## Common checks

### Check file

If a file exists:

```sh
if [[ -f .env ]]; then
  cat .env
fi
```

If it does not exist:

```sh
if [[ ! -f .env ]]; then
  echo 'File is missing: .env'
fi
```

See [Bash cheatsheet](https://devhints.io/bash) for more info.

### Variable not set

Abort the script if a check evaluates to false. Here we see if a variable is set.

```sh
$ [[ -z "$MY_VAR" ]] && (echo 'MY_VAR must be set' ; exit 1)
```

Use `-n` for not empty.


Note the brackets are needed, otherwise on a `true` evaluation of the first condition, the exit will still run.

Using `exit` is good for a script and not for direct terminal use otherwise you will close the terminal tab.

Or in multiple lines.

```sh
if [[ -z "$MY_VAR" ]]; do
  echo 'MY_VAR must be set'
  exit 1
fi
```

### Check if root user

```sh
if [ "$UID" -ne 0 ]; then
  echo 'I am not root'
fi
```

### Check if value in PATH

Check if `$HOME/.deno/bin` is in the `PATH` variable.

```sh
[[ "$PATH" == *$HOME/.deno/bin* ]] && echo 'yes' || echo 'no'
```

### Check if installed

```sh
if command -v node >/dev/null 2>&1; then
  echo 'Node is installed'
fi
```

Show an error and exit if a command is not available.

```sh
if ! command -v curl > /dev/null 2>&1;; then
  echo 'Please install `curl` and try again'
  exit 1
fi
```


## Status check

Check the exit status of a previous command.

### If

This is a multi-line `if` statement, which is useful for more complex statements or if readability is important.

```sh
false

if [[ "$?" -eq 0 ]]; then
  echo 'Passed!'
else
  echo 'Failed!'
  exit 1
fi
```

Show message on failure only:

```sh
false

if [[ "$?" -ne 0 ]]; then
  echo 'Failed!';
  exit 1
fi
```

### One-liner status check

Check if the status of the **previous** command was a pass or fail. This can help if the command is long and you don't want to fit it on one line.

#### Skip error

This will keep going and not abort the script.

```sh
$ [[ $? -eq 0 ]] && echo 'Passed!' || echo 'Failed!'
```

Example use:

- Use the `true` commands to give a zero (pass) exit status.
  ```sh
  $ true
  $ [[ $? -eq 0 ]] && echo 'Passed!' || echo 'Failed!'
  Passed!
  ```
- Use the `false` commands to give a non-zero (fail) exit status.
    ```sh
    $ false
    $ [[ $? -eq 0 ]] && echo 'Passed!' || echo 'Failed!'
    Failed!
    ```

#### Exit on error

Note brackets are needed.

```sh
$ false
$ [[ $? -eq 0 ]] && echo 'Passed!' || (echo 'Failed!'; exit 1)
```
