---
title: Control flow
---

Note the older format of `test CONDITION` is replaced by `[ CONDITION ]` and in some shell flavors extra functionality with `[[ CONDITION ]]`.

## Ignore file

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


## Check file

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


## Variable not set

Abort the script if a check evaluates to false. Here we see if a variable is set.

```sh
$ [[ -z "$MY_VAR" ]] && (echo 'MY_VAR must be set' ; exit 1)
```


Note the brackets are needed, otherwise on a `true` evaluation of the first condition, the exit will still run.

Using `exit` is good for a script and not for direct terminal use otherwise you will close the terminal tab. 


Or in multiple lines.

```sh
if [[ -z "$MY_VAR" ]]; do 
  echo 'MY_VAR must be set'
  exit 1
fi
```


## One-liner status check

Check if the status of the **previous** command was a pass or fail. This can help if the command is long and you don't want to fit it on one line.

### Skip error

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

### Exit on error

Note brackets are needed.

```sh
$ false
$ [[ $? -eq 0 ]] && echo 'Passed!' || (echo 'Failed!'; exit 1)
```


## If statement

This is a multi-line `if` statement, which is useful for more complex statements or if readability is important.

```sh
false

if [[ $? -eq 0 ]]; then
  echo 'Passed!'
else
  echo 'Failed!'
  exit 1
fi
```

Show message on failure only:

```sh
false

if [[ $? -ne 0 ]]; then
  echo 'Failed!';
  exit 1
fi
```
